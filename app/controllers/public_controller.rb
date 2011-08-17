class PublicController < ApplicationController
  # before_filter :authenticate
  
  def index
  end
  
  # should respond to post
  def sms
    account_sid = params[:AccountSid]
    body = params[:body]
    from = params[:from]
    from_zip =  params[:FromZip]
    if true #account_sid == TWILIO_ACCOUNT_SID && from && body
      sms_back = TwilioNet.new().send_sms('2146680255', truncate("FROM:#{from}  BODY:#{body}", 150) )
    end 
    render :text => "OK" 
  rescue
    render :text => "Invalid Params"
  end
  
end
