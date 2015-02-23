# == Schema Information
#
# Table name: stocks
#
#  id         :integer          not null, primary key
#  note_id    :integer          not null
#  user_id    :integer          not null
#  stocked    :boolean          default("0")
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_stocks_on_note_id  (note_id)
#  index_stocks_on_user_id  (user_id)
#

class Stock < ActiveRecord::Base
  include PublicActivity::Model
  include CreateFollow

  belongs_to :user
  belongs_to :note

  validates :note_id, presence: true
  validates :user_id, presence: true
end
