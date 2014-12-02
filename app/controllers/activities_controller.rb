class ActivitiesController < ApplicationController
  before_action :check_user

  def index
    @activities = PublicActivity::Activity.page(params[:page]).per(10).order(created_at: :desc)
      .where(recipient_id: current_user.id, owner_type: "User")
      .where.not(owner_id: current_user.id)
  end

  def update
    @activity = Activity.find(params[:id])
    if Activity.exists?(id: params[:id])
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
end
