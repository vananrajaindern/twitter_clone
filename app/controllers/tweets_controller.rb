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

    identify_tags
    sanitize_tags

    respond_to do |format|
      if @tweet.save
        @tags.each do |tag|
          new_tag = @tweet.tags.create(text: tag)
        end
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
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to tweets_path }
      format.js
    end
  end

  def view_followers
    @followers = Following.where(follower_id: current_user.id)
  end

  def view_followees
    @followees = Following.where(followee_id: current_user.id)
  end

  def search_tag
    @tag = Tag.find_by(text: params[:format])
    @tweets = @tag.tweets
  end

  private

  def tweet_params
    params.require(:tweet).permit(:text)
  end

  def comment_params
    params.require(:comment).permit(:text, :tweet_id)
  end

  def identify_tags
    @body = params[:tweet][:text]
    @tags = []
    @body << ' '

    while @body.include?('#')
      tag_start = @body.index('#')
      tag_end = @body.index(' ',tag_start)
      tag_length = tag_end - tag_start

      @tags << @body.slice!(tag_start, tag_length)
    end
  end

  def sanitize_tags
    @tags.each do |tag|
      tag.delete!('#')
      tag.upcase
    end
  end

end
