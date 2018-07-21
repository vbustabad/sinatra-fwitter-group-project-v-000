class UsersController < ApplicationController

  get '/login' do
    erb :'/users/login'
  end

  post '/login' do
  end

  get '/logout' do
  end

  post '/login' do
  @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/account'
    else
      redirect '/failure'
    end

  end
end
