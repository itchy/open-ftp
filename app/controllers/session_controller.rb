class SessionController < ApplicationController
  before_filter :authenticate, :except => [:login, :register, :logout]
  
  def login
    if params[:user] && params[:user][:email]
      user = User.find_by_email(params[:user][:email])
    end
    
    if user && user.authenticate(params[:user][:password])
      puts "HERE I AM \n#{user.inspect}"
      set_current_user(user)
      redirect_to box_files_path
      # render :text => "You're in!"
    else
      flash[:error] = "Invalid email/password combination!"
      redirect_to "/"
    end      
  end
  
  def register
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      render user_path(@user)
    else
      render :register
    end    
  end
  
  def logout
    set_current_user(nil)
    redirect_to "/"
  end
  
end
