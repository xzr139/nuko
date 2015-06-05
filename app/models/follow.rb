# == Schema Information
#
# Table name: followers
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  target_id  :integer
#  created_at :datetime
#  updated_at :datetime
#  followed   :boolean
#
# Indexes
#
#  index_followers_on_user_id  (user_id)
#

class Follow < ActiveRecord::Base
  belongs_to :user

  def target_user
    User.find(target_id)
  end
end
