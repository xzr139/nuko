class ApiController < ApplicationController
  skip_before_filter :authenticate_user!
end
