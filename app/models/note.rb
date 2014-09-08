class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :stock

  validates :title,  length: { maximum: 43 }
  acts_as_taggable

  def stocked?(user)
    !!user.stocks.find_by(note_id: self.id, stocked: true)
  end
end
