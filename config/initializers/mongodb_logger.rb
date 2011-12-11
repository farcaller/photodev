require 'mongodb_logger/server'

MongodbLogger::Server.use Rack::Auth::Basic do |username, password|
  cfg = YAML.load(File.read(File.join(Rails.root,'config','mongodb_logger.yml')))
  [username, password] == [cfg[Rails.env]['auth_user'], cfg[Rails.env]['auth_passwd']]
end