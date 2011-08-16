class DownloadsController < ApplicationController
  before_filter :authenticate
  @base_download_url = "#{BOX_API_URL}/download/"
  
  def download
    api
    
  end
  
end  