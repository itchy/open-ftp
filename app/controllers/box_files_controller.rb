class BoxFilesController < ApplicationController
  before_filter :authenticate
  
  def index
    xml = BoxFile.folder_xml(current_user)
    if BoxFile.box_auth_valid?(xml)
      @folders = BoxFile.folder_tree(xml)
    else
      @folders = {}
      current_user.box_auth_token = nil
      current_user.save
      flash[:error]= "The following error occured when trying to access Box:<br/>#{BoxFile.box_auth_status(xml)}<br/>"
      flash[:error]+= "Re-link your Box account to show files"
      redirect_to :action=>"show", :controller=>"users", :id => current_user.id  
    end    
  end

  def watch
    bf = current_user.box_files.find_or_initialize_by_file_id(params[:file_id])
    bf.name = params[:name]
    bf.watched = 1
    bf.save
    
    redirect_to :action => "index"
  end
  
  def unwatch
    bf = current_user.box_files.find_by_file_id(params[:file_id])
    bf.watched = 0
    bf.save
    
    redirect_to :action => "index"
  end

  def togle_notify
    bf = current_user.box_files.find_by_file_id(params[:file_id])
    # SSJ odd that I have to set this as a seperate var.  I figure that the meta methods only do get and set not math
    num = bf.notify
    bf.notify= (num-1).abs
    bf.save
    
    redirect_to :action => "index"
  end
  
  def increment_downloads
    bf = current_user.box_files.find_by_file_id(params[:file_id]) 
    # SSJ odd that I have to set this as a seperate var.  I figure that the meta methods only do get and set not math
    # num = bf.download_limit
    bf.download_limit += 1 #(num +1)
    bf.save
    
    redirect_to :action => "index"
  end

end
