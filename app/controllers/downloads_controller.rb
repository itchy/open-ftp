class DownloadsController < ApplicationController
  before_filter :authenticate, :except => :download_box_file
  # @base_download_url = "#{BOX_API_URL}/download/"
  
  def download_box_file
    box_file = BoxFile.find_by_watched_and_url_code(1, params[:url_code])
    if box_file && box_file.ok_to_pull?
      data = box_file.pull
      send_data data, :filename => box_file.name
    else
      render :text => "Whoa! Stop right there.  You are not on the list.  If you feel you should be on the list to download the selected file, please contact the person who controlls the requested file, and have them put you on the list."  
    end
  end
  
end  