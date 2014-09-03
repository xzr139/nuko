module UsersHelper
  def profile_image(user, style = :thumb)
    image_tag(user.avatar.url(style), alt: 'icon')
  end
end
