# == Schema Information
#
# Table name: activities
#
#  id             :integer          not null, primary key
#  trackable_id   :integer
#  trackable_type :string(255)
#  owner_id       :integer
#  owner_type     :string(255)
#  key            :string(255)
#  parameters     :text(65535)
#  recipient_id   :integer
#  recipient_type :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  unread         :boolean          default("1")
#

class Activity < PublicActivity::Activity
end
