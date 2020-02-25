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
      flash.now[:alert] = 'ツイートに失敗しました。もう一度ツイートしてみましょう。'
      render :index
    end
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      if tweet.destroy
        flash[:notice] = 'ツイートが削除されました'
        redirect_to action: 'index'
      else
        flash.now[:alert] = 'ツイートが削除できませんでした。もう一度削除してみましょう。'
        render :index
      end
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
