class BoxFolder
  # files represent an array of BoxFile.id's
  # folders represent an array of boxFolder.id's
  attr_accessor :folders, :files, :id, :name
  
  def initialize
    @folders=[]
    @files=[]
  end 
  
  def open(user)
    BoxFolder.open_folder(user, self.id)
  end 
  
  def folders?
    !self.folders.empty?
  end
  
  def files?
    !self.files.empty?
  end
  
  class << self
    def open_folder(user, folder_id=0)
      xml=self.get_folder_xml(user, folder_id)
      self.folder_tree(xml)
    end
    
    def box_auth_status(xml)
      Hashie::Mash.new(Hash.from_xml(xml)).response.status
    end
    
    def box_auth_valid?(xml)
      self.box_auth_status(xml) == "listing_ok"
    end
     
    def get_folder_xml(user, folder_id=0)
      url = "#{BOX_API_URL}/rest?action=get_account_tree&"
      url += "api_key=#{BOX_API_KEY}&auth_token=#{user.box_auth_token}"
      url += "&folder_id=#{folder_id}&params[]=nozip"    
      RestClient.get(url, :accept => 'XML')
    end
  
    def folder_tree(xml)
      return unless self.box_auth_valid?(xml)
      base = Hashie::Mash.new(Hash.from_xml(xml)).response.tree.folder #.folders.folder
      tree = BoxFolder.new
      tree.id = base.id
    
      if base.folders?
        folder_array = base.folders.flatten
        folder_array.shift
        folder_array.flatten.each do |folder| 
          bf = BoxFolder.new
          bf.id = folder.id
          bf.name = folder.name
          tree.folders << bf 
        end  
      end
      
      if base.files?
        file_array = base.files.flatten
        file_array.shift
        file_array.flatten.each do |file| 
          bf = BoxFile.new
          bf.id = file.id
          bf.name = file.file_name
          bf.watched = BoxFile.find_by_file_id_and_watched(file.id, 1)
          tree.files << bf
        end  
      end  
    
      tree
      
      # tree_hash = {}    
      # folders.each do |folder|
      #   tree_hash[folder.name] = {:id => folder.id }
      # 
      #   files = [folder.files.file].flatten(1)
      #   tree_hash[folder.name][:files] = files.each.collect do |file|
      #     { :id => file.id,  :name => file.file_name, :watched => BoxFile.find_by_file_id_and_watched(file.id, 1) }
      #   end
      # end    
      # tree_hash
    end
    
  end
end  