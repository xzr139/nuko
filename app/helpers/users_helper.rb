module UsersHelper
  def profile_image(user, size = "30x30")
    image_tag(user.avatar.url, class: "changeable-size-image", size: size, alt: "icon")
  end

  def facebook?
    session["facebook_data"]
  end
end
