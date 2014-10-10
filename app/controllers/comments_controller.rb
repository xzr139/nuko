class CommentsController < ApplicationController

  def create
    comment = Note.find(params[:note_id]).comments.build(comment_params)
    comment.user_id = current_user.id

    if comment.save
      redirect_to note_path(comment.note), notice: t("comments.created")
    else
      redirect_to note_path(comment.note), notice: t("comments.failed")
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :note_id, :content)
  end
end
