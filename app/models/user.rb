class User < ActiveRecord::Base
  has_many :notes
  has_attached_file :avatar,
    styles: { medium: "300x300>", thumb: "20x20>" },
    default_url: "/images/default_image.png"

  validates_attachment_content_type :avatar,
    content_type: /\Aimage\/.*\Z/

  def self.set_data_from_omnifb_info(fb_info)
    where(facebook_id: fb_info["uid"]).first_or_create do |user|
      user.facebook_id =  fb_info["uid"]
      user.email       =  fb_info["info"]["email"]
      user.full_name   =  fb_info["extra"]["raw_info"]["name"]
      user.token       =  fb_info["credentials"]["token"]
      user.company     =  fb_info["extra"]["raw_info"]["work"].first["employer"]["name"] if fb_info["extra"]["raw_info"]["work"]
    end
  end
end
