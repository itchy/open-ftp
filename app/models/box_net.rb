class BoxNet < Box::Api
  attr_accessor #:ticket
  
  def initialize
    super BOX_API_KEY
  end
  
  def ticket
    @ticket_request ||= self.get_ticket
    if @ticket_request && @ticket_request['status'] == 'get_ticket_ok'
      @ticket_request['ticket']
    end
    rescue
      STDERR.puts "An error occured getting your ticket"
      false  
  end
  
  def auth_url
    @ticket ||= self.ticket
    if @ticket
      "https://www.box.net/api/1.0/auth/#{@ticket}"
    end
  end
  
  
end
