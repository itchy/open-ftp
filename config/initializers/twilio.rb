if ENV['RAILS_ENV'] == "production"
   yml_file = '/api.yml'
else
   yml_file = '/api.yml.private'
end


apiconfig = YAML.load_file(File.expand_path(File.dirname(__FILE__)) + yml_file )

TWILIO_ACCOUNT_SID= ENV['TWILIO_ACCOUNT_SID'] || apiconfig["twilio"]["account_sid"]  
TWILIO_AUTH_TOKEN= ENV['TWILIO_AUTH_TOKEN'] || apiconfig["twilio"]["auth_token"]  
TWILIO_NUMBER= ENV['TWILIO_NUMBER'] || apiconfig["twilio"]["phone_number"].to_s