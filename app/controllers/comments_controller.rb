class CommentsController < ApplicationController
  before_action :set_variables
  
  def create
    comment = Comment.new(text: comment_params[:text], user_id: current_user.id, tweet_id: @tweet.id)
    if comment.save
      flash[:notice] = 'コメントが完了したよ'
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = 'コメントに失敗しました。もう一度コメントしてみましょう。'
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
  end

  private  
  def set_variables
    @tweet = Tweet.find(params[:tweet_id])
  end

  def comment_params
    params.permit(:text)
  end
end
