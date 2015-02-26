# == Schema Information
#
# Table name: follow_activities
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  target_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#  followed    :boolean
#  follow_type :string(255)
#
# Indexes
#
#  index_followers_on_user_id  (user_id)
#

class FollowActivity < ActiveRecord::Base
  include PublicActivity::Model
  include CreateFollow

  belongs_to :user

  validates :user_id, presence: true
  validates :target_id, presence: true
end
