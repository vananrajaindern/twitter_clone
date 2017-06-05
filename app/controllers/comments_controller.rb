class CommentsController < ApplicationController

  def new
    @tweet = Tweet.find(params[:tweet_id])
    @comment = Comment.new
  end

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @comment = current_user.comments.build(comment_params.merge(tweet: @tweet))
    @comment.save
    redirect_to tweet_path(@tweet)
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :tweet_id)
  end

end
