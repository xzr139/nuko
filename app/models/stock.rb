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
# Indexes
#
#  index_stocks_on_note_id  (note_id)
#  index_stocks_on_user_id  (user_id)
#

class Stock < ActiveRecord::Base
  include PublicActivity::Model

  belongs_to :user
  belongs_to :note

  validates :note_id, presence: true
  validates :user_id, presence: true

  after_create :increment_stock_count
  after_update :update_stock_count

  def increment_stock_count
    note.update(stock_count: note.stock_count + 1)
  end

  def update_stock_count
    note.update(stock_count: note.stock_count - 1) unless stocked
  end
end
