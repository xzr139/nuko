class SearchesController < ApplicationController
  def index
    @notes = Note.page(params[:page]).per(10).order(created_at: :desc).search(content_cont: params['content']).result.includes(:user)

    respond_to do |format|
      format.html
      format.json { render json: { notes: @notes } }
    end
  end
end
