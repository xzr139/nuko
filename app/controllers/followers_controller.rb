class FollowersController < ApplicationController
  def update
    @follow = current_user.follow_activities.find_by(target_id: params[:user_id])
    @follower = current_user.followers.find_by(target_id: params[:user_id])

    ActiveRecord::Base.transaction do
      if current_user.follow_activities.exists?(target_id: params[:user_id]) && current_user.followers.exists?(target_id: params[:user_id])
        @follow.update!(followed: current_user.follow_activities.exists?(target_id: params[:user_id], followed: false))
        @follower.update!(followed: current_user.follow_activities.exists?(target_id: params[:user_id], followed: false))
      else
        @follow = current_user.follow_activities.build(target_id: params[:user_id], followed: true)
        @follow.create_follow current_user
        @follow.create_activity :create, owner: current_user, recipient: User.find(@follow.target_id)
        @follower = current_user.followers.build(target_id: params[:user_id], followed: true)
        @follower.save!
      end

      render nothing: true, status: :ok
    end
  rescue => ex
    logger.debug ex.message
    logger.debug ex.backtrace.join("\n")
    render json: { follow_error: @follow.errors, follower_error: @follower.errors }, status: :unprocessable_entity
  end
end
