class Note < ActiveRecord::Base
  belongs_to :user
  has_many :stocks

  validates :title,  length: { maximum: 40 }
  validates :content,  length: { maximum: 5000 }

  acts_as_taggable

  def stocked_by?(user = nil)
    if user
      !!user.stocks.find_by(note_id: self.id, stocked: true)
    else
      false
    end
  end

  def recipient
    user
  end
end
