if ENV['RAILS_ENV'] == "production"
   yml_file = '/api.yml'
else
   yml_file = '/api.yml.private'
end

BASE_URI = if ENV['RAILS_ENV'] == "production"
   "http://open-ftp.com"
else
   "http://localhost:3000"
end

apiconfig = YAML.load_file(File.expand_path(File.dirname(__FILE__)) + yml_file)

BOX_API_KEY = ENV['BOX_API_KEY'] || apiconfig["box"]["api_key"]  #put your box api key here
BOX_API_URL ="https://www.box.net/api/1.0"  #box api location

