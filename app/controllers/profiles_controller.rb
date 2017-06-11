class ProfilesController < ApplicationController

  def show
    @user = User.find(params[:id])
    @tweets = Tweet.where(user_id: @user.id)
    @following = Following.find_by(followee_id: @user.id, follower_id: current_user.id)
  end

end
