# == Schema Information
#
# Table name: stocks
#
#  id         :integer          not null, primary key
#  note_id    :integer          not null
#  user_id    :integer          not null
#  stocked    :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#

class Stock < ActiveRecord::Base
  include PublicActivity::Model

  belongs_to :user
  belongs_to :note
end
