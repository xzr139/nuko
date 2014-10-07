# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Note < ActiveRecord::Base
  belongs_to :user
  has_many :stocks

  validates :title,  length: { maximum: 40 }
  validates :content,  length: { maximum: 5000 }

  acts_as_taggable

  def stocked_by?(user = nil)
    if user
      user.stocks.exists?(note_id: id, stocked: true)
    else
      false
    end
  end

  def recipient
    user
  end
end
