class SearchesController < ApplicationController
  def index
    @notes = Note.page(params[:page]).per(10).order(created_at: :desc).search(content_cont: params['content']).result
  end
end
