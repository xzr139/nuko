# == Schema Information
#
# Table name: follow_activities
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  target_user_id :integer
#  follow_type    :string(255)
#  followed       :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class FollowActivity < ActiveRecord::Base
  include PublicActivity::Model
  include CreateFollow

  belongs_to :user

  validates :user_id, presence: true
  validates :target_id, presence: true
end
