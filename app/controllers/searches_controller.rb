class SearchesController < ApplicationController
  def index
    @notes = Note.search(content_cont: params['content']).result().page(params[:page]).per(10).order(created_at: :desc)
  end
end
