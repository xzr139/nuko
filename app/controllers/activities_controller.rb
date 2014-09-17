class ActivitiesController < ApplicationController
  before_action :check_user

  def index
    @activities = PublicActivity::Activity.order(created_at: :desc).where(recipient_id: current_user.id, owner_type: "User")
  end
end
