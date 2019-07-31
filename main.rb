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

get '/createaccount' do
  erb :createaccount
end

post '/users' do
  user = User.new
  user.username = params[:username]
  user.firstname = params[:firstname]
  user.lastname = params[:lastname]
  user.street_address = params[:street_address]
  user.city = params[:city]
  user.postcode = params[:postcode]
  user.country = params[:country]
  user.email = params[:email]
  user.password = params[:password]
  user.save
  erb :index
  redirect '/'
end



