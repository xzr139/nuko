class CommentsController < ApplicationController
  before_action :set_note, only: [:edit]
  before_action :set_comment, only: [:edit, :update, :destroy, :like, :unlike]
  before_action :check_user, only: [:edit]

  def edit
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to note_path(@comment.note), notice: t("comments.updated") }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :index }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    comment = Comment.new(comment_params)

    respond_to do |format|
      if comment.save
        format.html { redirect_to note_path(comment.note),  notice: t("comments.created") }
        format.json { render :show, status: :created, location: comment }
      else
        format.html { redirect_to note_path(comment.note),  notice: t("comments.failed") }
        format.json { render json: comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to note_path(@comment.note), notice: t("comments.deleted") }
      format.json { head :no_content }
    end
  end

  def like
    flag = @comment.likes.where(id: params["id"]).first_or_create(
      user_id: current_user.id,
      note_id: @comment.note.id,
      liked: true
    ).update(liked: true)

    respond_to do |format|
      if flag
        format.html { render nothing: true }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render nothing: true }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def unlike
    flag = @comment.likes.find_by(user_id: current_user.id).update(liked: false)

    respond_to do |format|
      if flag
        format.html { render nothing: true }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render nothing: true }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :note_id, :content)
  end

  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end

  def set_note
    @note = Note.find_by(id: params[:id])
  end

  def check_user
    redirect_to note_path(@comment.note), notice: t('common.no_permission') unless authenticated_user?(@comment.user)
  end
end
