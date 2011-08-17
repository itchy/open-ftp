class PublicController < ApplicationController
  # MixIn ActionView::Helpers::TextHelper for truncate 
  include ActionView::Helpers::TextHelper
  # before_filter :authenticate
  
  def index
  end
  
  def test_truncate
    truncate("my string", :length => 6)
  end
  
  # should respond to post
  def sms
    account_sid = params[:AccountSid]
    body = params[:body]
    from = params[:from]
    from_zip =  params[:FromZip]
    if account_sid == TWILIO_ACCOUNT_SID && from && body
      sms = TwilioNet.new()
      sms.send_sms('2146680255', truncate("FROM:#{from}  BODY:#{body}", :length => 159) )
    end 
    render :text => "OK" 
  rescue
    render :text => "Invalid Params #{params.inspect}"
  end
  
end
