class TweetsController < ApplicationController

  get '/tweets' do
    erb :'/tweets/tweets'
  end

  get '/tweets/new' do
    erb :'/tweets/create_tweet'
  end

  post '/tweets' do
    @tweet = Tweet.create(content: params[:tweet][:content], user_id: User.find_by(username: params[:tweet][:user][:username]).id)
    redirect to "/tweets/#{@tweet.id}"
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
    @tweet.content = params[:tweet][:content]
    @tweet.user.username = params[:tweet][:user][:username]
    @tweet.save
    redirect to "/tweets/#{@tweet.id}"
  end

  delete 'tweets/:id/delete' do
    @tweet = Tweet.find(params[:id])
    if is_logged_in?
      @tweet.destroy
      redirect to "/tweets"
    else
      redirect to "/login"
    end
  end

end
