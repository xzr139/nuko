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

class Stock < ActiveRecord::Base
  include PublicActivity::Model
  include CreateFollow

  belongs_to :user
  belongs_to :note

  validates :note_id, presence: true
  validates :user_id, presence: true
end
