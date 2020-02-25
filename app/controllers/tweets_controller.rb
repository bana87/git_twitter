class TweetsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @tweets = Tweet.all.includes(:user).order("created_at DESC").page(params[:page]).per(10)
  end
  
  def create
    tweet = Tweet.create(text: tweet_params[:text], user_id: current_user.id)
    if tweet.save
      flash[:notice] = 'ツイートが完了したよ'
      redirect_to action: 'index'
    else
      flash[:alert] = 'ツイートに失敗しました。もう一度ツイートしてみましょう。'
    end
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.destroy
    end
  end
  
  private
  def tweet_params
    params.permit(:text)
  end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
