class TweetsController < ApplicationController

  get '/tweets/new' do
    erb :'/tweets/new'
  end

  post '/tweets' do
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
