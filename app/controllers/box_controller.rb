class BoxController < ApplicationController
  before_filter :authenticate
  
  def token
    # this is where we set the user's box auth token
    @auth_box_url = BoxNet.new.auth_url
    if params[:auth_token]
      current_user.box_auth_token = params[:auth_token]
      current_user.save
    end
    
    rescue
      flash[:error] = "Unable to link your box account, please try again!"  
  end

end
