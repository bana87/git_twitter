class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweet = Tweet.new #たぶんなくても良い
  end
  
  def create
    Tweet.create(tweet_params)
  end
  
  private
  def tweet_params
    params.permit(:name, :text)
  end
end
