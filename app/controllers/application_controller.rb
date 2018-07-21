require 'pry'
require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :'/application/homepage'
  end

  get '/signup' do
    erb :'/application/signup'
  end

  post '/signup' do

    if params["username"].empty?
      redirect to '/signup'
    elsif params["email"].empty?
      redirect to '/signup'
    elsif params["password"].empty?
      redirect to '/signup'
    else
      @user = User.create(username: params["username"], email: params["email"], password: params["password"])
      session[:user_id] = @user.id
    end

    if !logged_in?
      redirect to "/signup"
    else
      redirect to "/tweets"
    end

  end

  helpers do

    def current_user
      User.find(session[:user_id])
    end

    def logged_in?
      !!session[:user_id]
    end

  end

end
