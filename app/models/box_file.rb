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
  
  def download_limit
    self.max_downloads ||= 0
  end
  
  def download_limit=(val)
    self.max_downloads ||= 0
    self.max_downloads = val
  end
  
  def notify_by_sms?
    notify > 0 
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
    self.downloads < self.download_limit
  end
  
  def pull
    return unless self.ok_to_pull?
    self.downloads += 1
    self.save
    TwilioNet.new().send_sms(self.user.sms_number, self.sms_message ) if self.notify_by_sms?
    RestClient.get self.pull_url
  end
  
  def sms_message
    msg = "Open-FTP - File: #{self.name} downloaded With code: #{self.url_code} Downloads: #{self.downloads}"
  end
  
end
