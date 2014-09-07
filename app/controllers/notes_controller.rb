class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @note = Note.new
    @notes = Note.page(params[:page]).per(10).order(id: :desc)
  end

  def show
  end

  def edit
  end

  def create
    @note = current_user.notes.build(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: "Note was successfully created." }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :index }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: "Note was successfully updated." }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: "Note was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def tag
    @notes = Note.tagged_with(params[:name]) ? Note.tagged_with(params[:name]).page(params[:page]) : []
  end

  private

  def set_note
    @note = Note.exists?(id: params[:id]) ? Note.find_by(id: params[:id]) : []
  end

  def note_params
    params.require(:note).permit(:title, :content, :tag_list)
  end
end
