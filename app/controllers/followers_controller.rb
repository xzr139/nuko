class FollowersController < ApplicationController
  def update
    @follow = current_user.follow_activities.find_by(target_id: params[:user_id])
    if current_user.follow_activities.exists?(target_id: params[:user_id])
      @follow.update(followed: current_user.follow_activities.exists?(target_id: params[:user_id], followed: false))
    else
      @follow = current_user.follow_activities.build(target_id: params[:user_id], followed: true)
      @follow.create_follow current_user
      @follow.create_activity :create, owner: current_user, recipient: User.find(@follow.target_id)
    end

    render nothing: true
  end
end
