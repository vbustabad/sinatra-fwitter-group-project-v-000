class TweetsController < ApplicationController

  get '/tweets' do
    erb :'/tweets/tweets'
  end

  get '/tweets/new' do
    erb :'/tweets/create_tweet'
  end

  post '/tweets' do
    @tweet = Tweet.create(params["tweet"])

    redirect to "/tweets/#{@tweet.id}"
  end

  get '/tweets/:id' do
  end

  get '/tweets/:id/edit' do
  end

  post '/tweets/:id' do
  end

  post 'tweets/:id/delete' do
  end

end
