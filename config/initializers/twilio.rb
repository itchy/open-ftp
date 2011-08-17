apiconfig = YAML.load_file(File.expand_path(File.dirname(__FILE__)) + '/api.yml')

TWILIO_ACCOUNT_SID=apiconfig["twilio"]["account_sid"]  
TWILIO_AUTH_TOKEN=apiconfig["twilio"]["auth_token"]  
TWILIO_NUMBER=apiconfig["twilio"]["phone_number"].to_s