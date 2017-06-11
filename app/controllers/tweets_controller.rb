class TweetsController < ApplicationController

  before_action :authenticate_user!

  def index
    @tweets = Tweet.all
    @users = User.all
    @tweet = Tweet.new
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def create
    @tweets = Tweet.all
    @users = User.all
    @tweet = current_user.tweets.build(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to tweets_path }
        format.js
      else
        format.html { render :index }
        format.js
      end
    end

  end

  def edit
    @tweet = Tweet.find(params[:id])

    if current_user.id != @tweet.user.id
      redirect_to tweets_path
    end

  end

  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update(tweet_params)
    redirect_to tweets_path
  end

  def destroy
    @tweets = Tweet.all
    @tweet = Tweet.find(params[:id])
    byebug
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to tweets_path }
      format.js
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:text)
  end

  def comment_params
    params.require(:comment).permit(:text, :tweet_id)
  end

end
