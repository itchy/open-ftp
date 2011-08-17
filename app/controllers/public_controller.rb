class PublicController < ApplicationController
  # before_filter :authenticate
  
  def index
  end
  
  # should respond to post
  def sms
    ps = params
    ps.delete("controller")
    ps.delete("action")
    unless ps.empty?
      sms_back = TwilioNet.new().send_sms('2146680255', ps)
    end 
    render :text => "OK" 
  end
  
end
