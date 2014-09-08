class UsersController < ApplicationController
  before_action :user_params, only: [:update]
  before_action :set_user, only: [:show, :tag, :stocks]
  before_action :set_notes, only: [:show, :tag, :stocks]
  before_action :set_ranking, only: [:show, :tag, :stocks]

  def show
    @notes = @user.notes.present? ? @user.notes.page(params[:page]).per(10).order(id: :desc) : []
  end

  def update
    current_user.update(user_params)
    redirect_to user_path(current_user), notice: t("users.update.complate_update_nick_name")
  end

  def callback
    user = User.set_data_from_omnifb_info(request.env["omniauth.auth"])
    cookies[:token] = user.token
    if user.nick_name.present? && user.bio.present?
      redirect_to root_path, notice: t("common.signed_in")
    else
      redirect_to edit_user_path(user.id), notice: t("common.signed_in")
    end
  end

  def failure
    redirect_to root_url, notice: t('users.authentication_failed')
  end

  def sign_out
    cookies[:token] = nil
    redirect_to root_url, notice: t("common.signed_out")
  end

  def all_posts
    if User.find(params[:id])
      @user = User.find(params[:id])
    else
      redirect_to root_path, notice: t("users.not_found")
    end
  end

  def tag
    @notes = Note.tagged_with(params[:name]).exists?(user_id: params[:id]) ? Note.tagged_with(params[:name]).where(user_id: params[:id]).page(params[:page]).order(id: :desc) : []
  end

  def stocks
    @notes = []
    if @user.stocks.present?
      stocks = @user.stocks.order(created_at: :desc).select { |stock| stock.note.stocked?(@user) }
      stocks.each { |stock| @notes << stock.note }
    end

    @notes = Kaminari.paginate_array(@notes).page(params[:page])
  end

  private

  def user_params
    params.require(:user).permit(:nick_name, :bio, :avatar, :language)
  end

  def set_user
    if User.exists?(id: params[:id])
      @user = User.find(params[:id])
    else
      redirect_to root_path, notice: t('users.not_found')
    end
  end

  def set_notes
    @notes = @user.notes ? @user.notes.page(params[:page]).per(10).order(id: :desc) : []
  end

  def set_ranking
    words_hash = HashWithIndifferentAccess.new
    words_uniq = []

    tag_list = @notes.map { |note| note.tag_list }
    tag_list.each { |words_ary| words_ary.each { |words| words_uniq << words } }
    words_uniq.uniq.each { |word| words_hash[word] = Note.tagged_with(word).count }
    @ranking = words_hash.sort {|a,  b| b[1] <=> a[1] }[0...5]
  end
end
