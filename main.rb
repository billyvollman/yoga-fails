require 'sinatra'
require 'sinatra/reloader'
require_relative 'database_config'
require_relative 'models/fail'
require_relative 'models/comment'
require_relative 'models/user'
require_relative 'models/like'


get '/' do
  erb :index
end





