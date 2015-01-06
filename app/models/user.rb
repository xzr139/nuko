class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  INTERFACE_LANGUAGE = [
    %w(日本語 ja),
    %w(英語 en)
  ]

  SETTING_TYPE = %w(change_language_interface change_email_address change_password)

  has_many :notes
  has_many :stocks
  has_many :comments
  has_many :followers

  validates :nick_name, length: { maximum: 15 }
  validates :bio, length: { maximum: 300 }
  validates :facebook_id, presence: true
  validates :email, presence: true
  validates :full_name, presence: true
  validates :token, presence: true

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "20x20>" }, default_url: "/images/default_image.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def self.find_for_facebook_oauth(fb_info)
    user = User.where(provider: auth.provider,  uid: auth.uid).first

    unless user
      company = fb_info["extra"]["raw_info"]["work"] ? fb_info["extra"]["raw_info"]["work"][0]["employer"]["name"] : nil

      where(facebook_id: fb_info["uid"]).first_or_create(
        facebook_id: fb_info["uid"],
        email:       fb_info["info"]["email"],
        full_name:   fb_info["extra"]["raw_info"]["name"],
        token:       fb_info["credentials"]["token"],
        company:     company
      )
    end

    user
  end
end
