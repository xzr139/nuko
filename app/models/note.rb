class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :stock

  validates :title,  length: { maximum: 43 }
  acts_as_taggable

  def stocked_by?(user = nil)
    if user
      !!user.stocks.find_by(note_id: self.id, stocked: true)
    else
      false
    end
  end
end
