class HomeController < ApplicationController
  before_action :current_user, except: [:index]

  def index
  end
end
