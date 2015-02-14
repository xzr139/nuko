class TagsController < ApplicationController
  def index
  end

  def show
    @notes = Note.tagged_with(params[:name]) ? Note.tagged_with(params[:name]).page(params[:page]) : []
  end
end
