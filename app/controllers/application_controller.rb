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
    params["user"].each do |attr|
      if attr.empty?
        redirect '/signup'
      end
    end

    @user = User.new(params["user"])
    if @user && @user.authenticate(params["user"]["password"])
      @user.save
      redirect '/tweets/index'
    else
      redirect '/signup'
    end
  end

  def current_user
  end

  def logged_in?
  end

end
