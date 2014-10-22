class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :show]

  def index
    @note = Note.new
    @notes = Note.page(params[:page]).per(10).order(created_at: :desc)
  end

  def show
  end

  def edit
  end

  def create
    @note = current_user.notes.build(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: t("notes.created") }
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
        format.html { redirect_to @note, notice: t("notes.updated") }
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
      format.html { redirect_to notes_url, notice: t("notes.deleted") }
      format.json { head :no_content }
    end
  end

  def tag
    @notes = Note.tagged_with(params[:name]) ? Note.tagged_with(params[:name]).page(params[:page]) : []
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def set_comment
    @comment = Comment.new
  end

  def note_params
    params.require(:note).permit(:title, :content, :tag_list)
  end
end
