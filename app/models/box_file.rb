class BoxFile < ActiveRecord::Base
  belongs_to :user
  has_many :download_codes
  after_create :set_url_code 
  
  validates :url_code, :uniqueness => true
  
  def set_url_code  
    self.url_code = (0...8).map{65.+(rand(25)).chr}.join
    if self.valid?
      self.save
    else
      self.set_url_code
    end    
  end
  
  def downloads
    self.download_count ||= 0
  end
  
  def downloads=(val)
    self.download_count ||= 0
    self.download_count = val
  end  
  
  def public_urls
    # this will one day include the download code
    ["#{BASE_URI}/downloads/#{self.url_code}"]
  end
  
  def pull_url
    "#{BOX_API_URL}/download/#{self.user.box_auth_token}/#{self.file_id}"
  end
  
  def ok_to_pull?
    # put in validations
    true
  end
  
  def pull
    return unless self.ok_to_pull?
    self.downloads += 1
    self.save
    RestClient.get self.pull_url
  end
  
  class << self 
    def folder_xml(user, folder_id=0)
      url = "#{BOX_API_URL}/rest?action=get_account_tree&"
      url += "api_key=#{BOX_API_KEY}&auth_token=#{user.box_auth_token}"
      url += "&folder_id=#{folder_id}&params[]=nozip"    
      RestClient.get(url, :accept => 'XML')
    end
  
    def folder_tree(xml)
      folders = Hashie::Mash.new(Hash.from_xml(xml)).response.tree.folder.folders.folder
    
      tree_hash = {}    
      folders.each do |folder|
        tree_hash[folder.name] = {:id => folder.id }
      
        files = [folder.files.file].flatten(1)
        tree_hash[folder.name][:files] = files.each.collect do |file|
          { :id => file.id,  :name => file.file_name, :watched => BoxFile.find_by_file_id_and_watched(file.id, 1) }
        end
      end    
      tree_hash
    end
    
  end  
end
