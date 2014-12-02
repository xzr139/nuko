class FollowersController < ApplicationController
  def update
    @follow = current_user.followers.find_by(user_id: params[:user_id])
    if current_user.followers.exists?(user_id: params[:user_id])
      @follow.update(followed: current_user.followers.exists?(target_user_id: params[:user_id], followed: false))
    else
      @follow = current_user.followers.build(target_user_id: params[:user_id], followed: true)
      @follow.save
    end

    render nothing: true
  end
end
