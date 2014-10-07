class ActivitiesController < ApplicationController
  before_action :check_user

  def index
    @activities = PublicActivity::Activity.page(params[:page]).per(10).order(created_at: :desc)
      .where(recipient_id: current_user.id, owner_type: "User")
      .where.not(owner_id: current_user.id)
  end

  def update
    if Activity.exists?(id: params[:id])
      Activity.find(params[:id]).update(unread: false)
    end

    render nothing: true
  end
end
