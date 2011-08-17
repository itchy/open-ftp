class TwilioNet < Twilio::REST::Client

  def initialize
    super(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)
  end  
  
  def send_sms(to, body)
    #this sends the text
    sms_response = self.account.sms.messages.create({:from => '+14155992671', :to => to, :body => body})
    puts sms_response
  end
  
end  