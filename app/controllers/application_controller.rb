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
      session[:user_id] = @user.id
      redirect to '/tweets'
    else
      redirect to '/signup'
    end
  end

  helpers do

    def current_user
      User.find(session[:user_id])
    end

    def is_logged_in?
      !!session[:user_id]
    end

  end

end
