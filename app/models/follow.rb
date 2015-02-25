# == Schema Information
#
# Table name: followers
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  target_user_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#  followed       :boolean
#
# Indexes
#
#  index_followers_on_user_id  (user_id)
#

class Follow < ActiveRecord::Base
  include PublicActivity::Model
  belongs_to :user

  validates :user_id, presence: true
  validates :target_user_id, presence: true
end
