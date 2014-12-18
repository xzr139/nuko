module UserActions
  extend ActiveSupport::Concern

  def all_posts
    if User.find(params[:id])
      @user = User.find(params[:id])
    else
      redirect_to root_path, notice: t("users.not_found")
    end
  end

  def tag
    if Note.tagged_with(params[:name]).exists?(user_id: params[:id])
      @notes = Note.tagged_with(params[:name]).where(user_id: params[:id]).page(params[:page]).order(id: :desc)
    else
      @notes = []
    end
  end

  def stocks
    @notes = []
    if @user.stocks.present?
      stocks = @user.stocks.order(created_at: :desc).select { |stock| stock.note && stock.note.stocked_by?(@user) }
      stocks.each { |stock| @notes << stock.note }
    end

    @notes = Kaminari.paginate_array(@notes).page(params[:page])
  end

  private

  def user_params
    params.require(:user).permit(:email, :nick_name, :bio, :avatar, :language, :show_company)
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
    @ranking = words_hash.sort { |a,  b| b[1] <=> a[1] }[0...5]
  end
end
