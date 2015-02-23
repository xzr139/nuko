class FollowersController < ApplicationController
  def update
    @follow = current_user.followers.find_by(target_id: params[:target_id])
    if current_user.followers.exists?(target_id: params[:user_id])
      @follow.update(followed: current_user.followers.exists?(target_id: params[:target_id], followed: false))
    else
      @follow = current_user.followers.build(target_id: params[:target_id], followed: true)
      @follow.save
      @follow.create_follow current_user
      @follow.create_activity :create, owner: current_user, recipient: User.find(@follow.target_id)
    end

    render nothing: true
  end
end
