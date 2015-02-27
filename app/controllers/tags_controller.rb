class TagsController < ApplicationController
  def index
  end

  def show
    @notes = Note.tagged_with(params[:name]) ? Note.tagged_with(params[:name]).page(params[:page]) : []
  end

  def follow
    @follow = current_user.follow_activities.find_by(target_id: params[:target_id])
    @tag = Tag.find(params[:target_id])

    if current_user.follow_activities.exists?(target_id: params[:target_id])
      @follow.update(followed: current_user.follow_activities.exists?(target_id: params[:target_id], followed: false))
    else
      @follow = current_user.follow_activities.build(target_id: params[:target_id], followed: true)
      @follow.create_follow @tag
      @follow.create_activity :create, owner: current_user, recipient: User.find(@follow.target_id)
    end

    render nothing: true
  end
end
