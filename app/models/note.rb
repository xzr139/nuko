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
#  deleted_at :datetime
#

class Note < ActiveRecord::Base
  belongs_to :user
  has_many :stocks
  has_many :comments

  validates :title, presence: true, length: { maximum: 40 }
  validates :content, presence: true, length: { maximum: 10000 }

  acts_as_taggable
  acts_as_paranoid

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
