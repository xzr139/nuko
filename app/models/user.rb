# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  facebook_id         :string(255)      not null
#  email               :string(255)
#  full_name           :string(255)
#  nick_name           :string(255)
#  token               :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  company             :string(255)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  bio                 :text
#  language            :string(255)
#  show_company        :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  INTERFACE_LANGUAGE = [
    %w(日本語 ja),
    %w(英語 en)
  ]

  SETTING_TYPE = [
    "change_language_interface",
    "change_email_address",
    "change_password"
  ]

  has_many :notes
  has_many :stocks
  has_many :comments
  has_many :followers

  validates :nick_name, length: { maximum: 15 }
  validates :bio, length: { maximum: 300 }

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "20x20>" }, default_url: "/images/default_image.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def self.add_user_from_omiauth(fb_info)
    company = fb_info["extra"]["raw_info"]["work"] ? fb_info["extra"]["raw_info"]["work"][0]["employer"]["name"] : nil

    where(facebook_id: fb_info["uid"]).first_or_create(
      facebook_id: fb_info["uid"],
      email:       fb_info["info"]["email"],
      full_name:   fb_info["extra"]["raw_info"]["name"],
      token:       fb_info["credentials"]["token"],
      company:     company
    )
  end
end
