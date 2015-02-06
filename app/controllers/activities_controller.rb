class ActivitiesController < ApplicationController
  before_action :check_user

  def index
    @activities = Activity.page(params[:page]).per(10).order(created_at: :desc)
      .where(recipient_id: current_user.id, owner_type: "User")
      .where.not(owner_id: current_user.id)
  end

  def update
    @activity = Activity.find(params[:id])
    Activity.where(recipient_id: current_user.id, unread: true).where.not(id: params["id"]).find_each do |activity|
      activity.unread = false
      activity.save
    end

    respond_to do |format|
      if @activity.update(unread: false)
        format.html { render nothing: true }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render nothing: true }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end
end
