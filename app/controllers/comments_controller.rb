class CommentsController < ApplicationController
  before_action :set_note, only: [:edit]
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :check_user, only: [:edit]

  def edit
  end

  def update
    @comment.update(comment_params)

    redirect_to note_path(@comment.note), notice: t("comments.updated")
  end

  def create
    comment = Comment.new(comment_params)

    if comment.save
      redirect_to note_path(comment.note), notice: t("comments.created")
    else
      redirect_to note_path(comment.note), notice: t("comments.failed")
    end
  end

  def destroy
    @comment.destroy
    redirect_to note_path(@comment.note)
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
    redirect_to note_path(@comment.note), notice: t('common.no_permission') unless signed_in? && @comment.user == current_user
  end
end
