class ProfilesController < ApplicationController
  include UserActions

  before_action :user_params, only: [:update]
  before_action :set_user, only: [:show, :tag, :stocks]
  before_action :set_notes, only: [:show, :tag, :stocks]
  before_action :set_ranking, only: [:show, :tag, :stocks]

  def show
    @notes = @user.notes.present? ? @user.notes.page(params[:page]).per(10).order(id: :desc) : []
  end
end
