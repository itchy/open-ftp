class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

private  
  def current_user
    @user ||= User.find(session[:user_id])
    rescue
      nil
  end
  
  def set_current_user(user)
    if user && user.respond_to?(:id)
      @user = user
      session[:user_id] = @user.id
    else
      @user = nil
      session[:user_id] = nil
    end    
  end
  
  def authenticate
    session[:user_id] = current_user.id
    current_user.id
  end
end
