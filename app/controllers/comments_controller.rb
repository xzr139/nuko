class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:like]

  before_action :set_comment, only: [:edit, :update, :destroy, :like, :unlike]
  before_action :set_note, only: [:edit]
  before_action :check_user, only: [:edit]

  def edit
    respond_to do |format|
      format.html
      format.json { render json: { comment: @comment, note: @note } }
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to note_path(@comment.note), notice: t("comments.updated") }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { redirect_to note_path(@comment.note) }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html do
          redirect_to note_path(@comment.note),  notice: t("comments.created")
          @comment.create_activity :create, owner: current_user, recipient: Note.find(comment_params['note_id']).recipient unless Note.find(comment_params['note_id']).recipient == current_user
        end
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to note_path(@comment.note),  notice: t("comments.failed") }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
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
    like = @comment.likes.find_by(user_id: current_user.id, comment_id: params[:id])

    flag =
      if like.present? && like.liked
        like.update(liked: false)
      elsif like.present? && like.liked.blank?
        like.update(liked: true)
      else
        @comment.likes.create(
          user_id: current_user.id,
          note_id: @comment.note.id,
          liked: true
        )
      end

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
    @note = Note.find_by(id: @comment.note.id)
  end

  def check_user
    redirect_to note_path(@comment.note), notice: t('common.no_permission') unless authenticated_user?(@comment.user)
  end
end
