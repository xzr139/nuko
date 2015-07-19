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
#  unread         :boolean          default(TRUE)
#
# Indexes
#
#  index_activities_on_owner_id_and_owner_type          (owner_id,owner_type)
#  index_activities_on_recipient_id_and_recipient_type  (recipient_id,recipient_type)
#  index_activities_on_trackable_id_and_trackable_type  (trackable_id,trackable_type)
#

class Activity < PublicActivity::Activity
end
