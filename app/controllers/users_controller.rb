class UsersController < ApplicationController

  session = {}

  get '/login' do
    erb :'/users/login'
  end

  post '/login' do
    @user = User.find_by(username: params[:username])

      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect to "/tweets"
      else
        redirect to "/"
      end

  end

  get '/logout' do
    session.clear
  end

end
