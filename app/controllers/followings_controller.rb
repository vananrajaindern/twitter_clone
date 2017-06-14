class FollowingsController < ApplicationController

  def create
    @follower = current_user
    @followee = User.find_by(username: params[:username])

    if @followee != @follower
      @following = @follower.is_following.build(followee: @followee)
      @following.save
    end

    respond_to do |format|
      format.html { redirect_to profile_path(@followee.username) }
      format.js
    end
  end

  def destroy
    @followee = User.find_by(username: params[:username])
    @following = Following.find_by(follower_id: current_user.id, followee_id: @followee.id)
    @following.destroy
    redirect_to profile_path(@followee.username)
  end

end
