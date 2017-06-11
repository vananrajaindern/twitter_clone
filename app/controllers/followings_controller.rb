class FollowingsController < ApplicationController

  def create
    @follower = current_user
    @followee = User.find(params[:id])
    if @followee != @follower
      Following.create(follower: @follower, followee: @followee)
      redirect_to profile_path(@followee)
    end
  end

  def destroy
    @followee = User.find(params[:id])
    @following = Following.find_by(follower_id: current_user.id, followee_id: @followee.id)
    @following.destroy
    redirect_to profile_path(@followee)
  end

end
