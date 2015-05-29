class ActivitiesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:update]
  before_action :check_user

  def index
    @activities = Activity.page(params[:page]).per(10).order(created_at: :desc)
      .where(recipient_id: current_user.id, owner_type: "User")
      .where.not(owner_id: current_user.id)

    respond_to do |format|
      format.html
      format.json { render json: { activities: @activities } }
    end
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
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render nothing: true }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end
end
