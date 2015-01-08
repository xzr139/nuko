class UsersController < ApplicationController
  include UserActions

  before_action :user_params, only: [:update]
  before_action :set_user, only: [:show, :tag, :stocks]
  before_action :set_notes, only: [:show, :tag, :stocks]
  before_action :set_ranking, only: [:show, :tag, :stocks]
end
