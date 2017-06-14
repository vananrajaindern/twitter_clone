class ProfileController < ApplicationController

  def show
    @user = User.find_by(username: params[:username])
    @tweets = Tweet.where(user_id: @user.id)
    @following = Following.find_by(followee_id: @user.id, follower_id: current_user.id)
    @user_followers = Following.where(followee: @user)
    @user_followees = Following.where(follower: @user)
  end

end
