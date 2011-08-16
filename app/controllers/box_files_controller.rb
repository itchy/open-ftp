class BoxFilesController < ApplicationController
  before_filter :authenticate
  
  def index
    @folders = BoxFile.folder_tree(BoxFile.folder_xml(current_user)) 
    @files = []
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


end
