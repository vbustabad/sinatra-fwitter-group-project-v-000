require 'pry'
class TweetsController < ApplicationController

  get '/tweets' do
    if logged_in?
      @user = User.find_by(id: session[:user_id])
      erb :'/tweets/tweets'
    else
      redirect to("/login")
    end
  end

  get '/tweets/new' do
    if logged_in?
      erb :'/tweets/create_tweet'
    else
      redirect to("/login")
    end
  end

  post '/tweets' do
    if params[:content].empty?
      redirect to("/tweets/new")
    else
      @tweet = Tweet.create(content: params[:tweet][:content])
      redirect to("/tweets/#{@tweet.id}")
    end
  end

  get '/tweets/:id' do
    @tweet = Tweet.find(params["id"])

    erb :'/tweets/show_tweet'
  end

  get '/tweets/:id/edit' do
    @tweet = Tweet.find(params[:id])
    erb :'/tweets/edit_tweet'
  end

  patch '/tweets/:id' do
    @tweet = Tweet.find(params[:id])

    if !params[:tweet][:content].empty
      @tweet.content = params[:tweet][:content]
      @tweet.save
    else
      redirect to("/tweets/#{@tweet.id}/edit")
    end

    @tweet.user.username = params[:tweet][:user][:username]
    @tweet.save

    redirect to("/tweets/#{@tweet.id}")
  end

  delete 'tweets/:id/delete' do
    @tweet = Tweet.find(params[:id])
    if logged_in?
      @tweet.destroy
      redirect to("/tweets")
    else
      redirect to("/login")
    end
  end

end
