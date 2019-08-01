require 'sinatra'
require 'sinatra/reloader'
require_relative 'database_config'
require_relative 'models/fail'
require_relative 'models/comment'
require_relative 'models/user'
require_relative 'models/like'

enable :sessions

helpers do

  def logged_in? 
    !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

end

after do
  ActiveRecord::Base.connection.close
end

get '/' do
  @fails = Fail.all
  erb :index
end

get '/my_fails' do
  @fails = Fail.all
  erb :my_fails
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
  session[:user_id] = user.id
  redirect '/'
end

get '/login' do
  erb :login
end

post '/sessions' do
user = User.find_by(email: params[:email])
if user && user.authenticate(params[:password])
  session[:user_id] = user.id
  redirect "/"
else
  erb :login
end

end

delete '/sessions' do
session[:user_id] = nil
redirect '/login'
end

