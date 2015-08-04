class ProfilesController < ApplicationController
  before_action :user_params, only: [:update]
  before_action :set_user, only: [:show, :tag, :stocks]
  before_action :set_notes, only: [:show, :tag, :stocks]
  before_action :set_ranking, only: [:show, :tag, :stocks]
  before_action :set_followers, only: [:show, :tag, :stocks]
  before_action :set_popular, only: [:show, :tag, :stocks]

  def show
    @notes = @user.notes.present? ? @user.notes.page(params[:page]).per(10).order(id: :desc) : []

    respond_to do |format|
      format.html
      format.json { render json: { notes: @notes, user: @user, ranking: @ranking } }
    end
  end

  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to profile_path(current_user),  notice: t("users.update.complate_update_profiles") }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end

      sign_in(current_user,  bypass: true) if user_params["password"]
    end
  end

  def all_posts
    @user = User.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: { user: @user } }
    end
  end

  def tag
    if Note.tagged_with(params[:name]).exists?(user_id: params[:id])
      @notes = Note.tagged_with(params[:name]).where(user_id: params[:id]).page(params[:page]).order(id: :desc).includes(:user)
    else
      @notes = []
    end

    respond_to do |format|
      format.html
      format.json { render json: { notes: @notes, user: @user, ranking: @ranking } }
    end
  end

  def stocks
    @notes = []
    if @user.stocks.present?
      stocks = @user.stocks.includes(note: :user).order(created_at: :desc).select { |stock| stock.note && stock.note.stocked_by?(@user) }
      @notes = stocks.map(&:note)
    end

    @notes = Kaminari.paginate_array(@notes).page(params[:page])

    respond_to do |format|
      format.html
      format.json { render json: { notes: @notes, user: @user, ranking: @ranking } }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :nick_name, :bio, :avatar, :language, :show_company)
  end

  def set_user
    if User.exists?(id: params[:id])
      @user = User.find(params[:id])
    else
      redirect_to root_path, notice: t('users.not_found')
    end
  end

  def set_notes
    @notes = @user.notes.present? ? @user.notes.page(params[:page]).per(10).order(id: :desc) : []
  end

  def set_ranking
    words_hash = HashWithIndifferentAccess.new
    words_uniq = []

    tag_list = @notes.map(&:tag_list)
    tag_list.each { |words_ary| words_ary.each { |words| words_uniq << words } }
    words_uniq.uniq.each { |word| words_hash[word] = Note.tagged_with(word).count }
    @ranking = words_hash.sort { |a, b| b[1] <=> a[1] }[0...5]
  end

  def set_followers
    @followers = @user.followers
  end

  def set_popular
    @popular_notes = @user.notes.order(stock_count: :desc).limit(5)
  end
end
