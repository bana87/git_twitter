class FavoritesController < ApplicationController
  def create
    @fav = Favorite.new(user_id: current_user.id, tweet_id: params[:tweet_id])
    @fav.save
    @tweet = Tweet.find_by(id: @fav.tweet_id)
    @fav_count = Favorite.where(tweet_id: params[:tweet_id]).count
  end
  
  def delete
    @fav = Favorite.new(user_id: current_user.id, tweet_id: params[:tweet_id])
    @tweet = Tweet.find_by(id: @fav.tweet_id)
    @fav.destroy
    @fav_count = Favorite.where(tweet_id: params[:tweet_id]).count
  end
end
