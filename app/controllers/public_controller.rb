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
    body = params[:Body]
    from = params[:From]
    from_zip =  params[:FromZip]
    if from && body && # account_sid == TWILIO_ACCOUNT_SID 
      sms = TwilioNet.new()
      sms.send_sms('2146680255', truncate("FROM:#{from}  BODY:#{body}", :length => 159) )
      render :layout => 'empty', :template => 'public/sms'  
    else
      raise error  
    end 
  rescue
    render :text => "Invalid Params #{params.inspect}"
  end
  
  def intro
    
  end
  
end
