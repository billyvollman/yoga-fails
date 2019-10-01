require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'database_config'
require_relative 'models/fail'
require_relative 'models/comment'
require_relative 'models/user'
require_relative 'models/like'
require 'httparty'
require 'pry'



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
  @fails = Fail.order('created_at DESC')
  # @user_id = fail.user_id.to_i
  # fail = Fail.all
  # fail.find_by(id: 7)
  # fail.find_by(id: 7).user_id.to_i
  # user_id = fail.find_by(id: 7).user_id.to_i
  # User.find_by(id: user_id).username
  # User.find_by(id: 2).username

  # fail[0].created_at.to_date
  # fail.created_at.strftime( "%l:%M %p, %e %b %Y")
  # binding.pry
  erb :index
end

get '/my_fails' do
  @fails = Fail.where(user_id: session[:user_id])
  # @fail = Fail.find(params[:id])
  erb :my_fails
end

get '/fails/new' do
  erb :new
end

post '/fails' do
  fail = Fail.new
  fail.title = params[:title]
  fail.location = params[:location]
  fail.tags = params[:tags]
  fail.image_url = params[:image_url]
  fail.user_id = session[:user_id]
  fail.save
  redirect '/'
end

get '/api/fails' do
  content_type :json
  Fail.all.to_json
end


# get '/api/comments' do
#   content_type :json
#   Comment.all.to_json
# end

get '/fails/:id' do
  @fail = Fail.find(params[:id])
  @comments = Comment.where(fail_id: params[:id])
  user_id = @fail.user_id.to_i
  @listing_owner_username = User.find_by(id: user_id).username
  
  erb :show
end

get '/fails/:id/edit' do
  @fail = Fail.find(params[:id])
  erb :edit
end

put '/fails/:id' do
  fail = Fail.find(params[:id])
  fail.title = params[:title]
  fail.location = params[:location]
  fail.tags = params[:tags]
  fail.save
  redirect "/fails/#{params[:id]}"
end

delete '/fails/:id' do
  fail = Fail.find(params[:id])
  fail.delete
  redirect "/my_fails"
end

post '/likes' do
  redirect '/login' unless logged_in?
  
  #making a like - only logged in users can do this right?
  like = Like.new
  like.fail_id = params[:fail_id]
  like.user_id = current_user.id
  like.save
  redirect "/fails/#{params[:fail_id]}"
end

post '/api/likes' do
  content_type :json
  like = Like.new
  like.fail_id = params[:fail_id]
  like.user_id = current_user.id
  if like.save
    {
      message: "we are good buddy!", 
      likes_count: Like.where(fail_id: like.fail_id).count 
    }.to_json
  else
    {message: "Houston we have a problem!"}.to_json
  end
end

post '/api/comments' do
  content_type :json
  comment = Comment.new
  comment.body = params[:body]
  comment.fail_id = params[:fail_id]
  comment.user_id = session[:user_id]
  # binding.pry
  if comment.save
    {
      message: "we are good buddy!",
      comment: Comment.where(fail_id: comment.fail_id).order(id: :desc)[0].body
    }.to_json
    # Comment.where(fail_id: comment.fail_id).last.body
  else
    {message: "Houston we have a problem!"}.to_json
  end
end

post '/comments' do
  comment = Comment.new
  comment.body = params[:body]
  comment.fail_id = params[:fail_id]
  comment.user_id = session[:user_id]
  comment.save
  redirect"/fails/#{params[:fail_id]}"
end

put '/comments' do
  comment = Comment.find(params[:id])
  comment.body = params[:body]
  comment.fail_id = params[:fail_id]
  comment.user_id = session[:user_id]
  comment.save
  redirect"/fails/#{params[:fail_id]}"
end

get '/comments/:id/edit' do
  @comment = Comment.find(params[:id])
  erb :comment_edit
end

delete '/comments' do
  comment = Comment.find(params[:id])
  comment.delete
  redirect"/fails/#{params[:fail_id]}"
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
  address = user.email
  if user.valid?
    user.save
    session[:user_id] = user.id
    redirect '/'
  else
    error = user.errors.messages
    @username = error[:username][0]
    @firstname = error[:firstname][0]
    @lastname = error[:lastname][0]
    @street_address = error[:street_address][0]
    @city = error[:city][0]
    @postcode = error[:postcode][0]
    @country = error[:country][0]
    @email = error[:email][0]
    @password = error[:password][0]
    erb :users
  end
end

get '/login' do
  erb :login
end

post '/sessions' do
  if User.find_by(username: params[:username])
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/"
    else
      erb :login
    end

  else User.find_by(email: params[:email])
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/"
    else
      erb :login
    end

  end

  # user = User.find_by(username: params[:username])
  # user = User.find_by(email: params[:email])
  # if user && user.authenticate(params[:password])
  #   session[:user_id] = user.id
  #   redirect "/"
  # else
  #   erb :login
  # end
end

delete '/sessions' do
  session[:user_id] = nil
  redirect '/login'
end

get '/stopfailing' do
  if logged_in? 
    user = User.find(session[:user_id])
    @key = ENV["GOOGLE_API_KEY"]
    search_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=yoga+in+melbourne&region=AU&radius=5000&key=#{@key}"
    search_result = HTTParty.get(search_url)
    @yoga_studios = search_result["results"]
    erb :stopfailing
  else
    redirect '/createaccount'
  end
end
