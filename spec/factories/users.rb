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
#  sign_in_count          :integer          default(0), not null
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
#  show_company           :boolean          default(FALSE)
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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:facebook_id) { |n| n * 1000 }
    sequence(:email) { |n| "sachin#{n}@gmail.com" }
    sequence(:full_name) { |n| "hoge fuga foo#{n}" }
    sequence(:nick_name) { |n| "sachin#{n}" }
    sequence(:token) { |n| "token#{n}" }
    sequence(:company) { |n| "company#{n}" }
    sequence(:bio) { |n| "jikoshoukai#{n}" }
    sequence(:password) { |n| "password#{n}" }
    language :ja
  end
end
