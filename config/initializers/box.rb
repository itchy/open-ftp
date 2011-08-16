apiconfig = YAML.load_file(File.expand_path(File.dirname(__FILE__)) + '/api.yml')

BOX_API_KEY =apiconfig["box"]["api_key"]  #put your box api key here
BOX_API_URL ="https://www.box.net/api/1.0"  #box api location