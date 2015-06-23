# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  facebook_id            :string(255)
#  full_name              :string(255)
#  nick_name              :string(255)
#  token                  :string(255)
#  company                :string(255)
#  bio                    :text(65535)
#  language               :string(255)
#  show_company           :boolean          default("0")
#  created_at             :datetime
#  updated_at             :datetime
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_nick_name             (nick_name) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook], authentication_keys: [:login]

  INTERFACE_LANGUAGE = [
    %w(日本語 ja),
    %w(英語 en)
  ]

  SETTING_TYPE = %w(change_language_interface change_email_address change_password)

  before_save { self.email = email.downcase }

  has_many :notes
  has_many :stocks
  has_many :comments
  has_many :likes
  has_many :follow_activities
  has_many :followers

  validates :nick_name, length: { maximum: 15 }
  validates :bio, length: { maximum: 300 }
  validates :email, presence: true

  attr_accessor :login

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "20x20>" }, default_url: "/images/default_image.png"

  validates_attachment_content_type :avatar, content_type: %r{\Aimage\/.*\Z}

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

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)

    if login
      where(conditions).where(["nick_name = :value OR lower(email) = lower(:value)", { value: login }]).first
    else
      where(conditions).first
    end
  end

  def contributions
    Stock.where(user_id: id).size
  end
end
