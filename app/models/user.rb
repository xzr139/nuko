class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

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
  validates :email, presence: true

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "20x20>" }, default_url: "/images/default_image.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def self.find_for_facebook_oauth(fb_info)
    data = fb_info['extra']['raw_info']

    User.find_by(facebook_id: data['id']) if data
  end

  def self.merge_facebook_account(user, data, work)
    company = work ? work["employer"]["name"] : nil

    user.update(
      facebook_id: data["uid"],
      email:       data["info"]["email"],
      full_name:   data["info"]["name"],
      token:       data["credentials"]["token"],
      company:     company
    )
  end
end
