# == Schema Information
#
# Table name: notes
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  content        :text(65535)
#  user_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#  deleted_at     :datetime
#  comments_count :integer          default("0"), not null
#
# Indexes
#
#  index_notes_on_user_id  (user_id)
#

class Note < ActiveRecord::Base
  belongs_to :user
  has_many :stocks
  has_many :comments, counter_cache: :comments_count
  has_many :likes

  validates :title, presence: true, length: { maximum: 40 }
  validates :content, presence: true, length: { maximum: 10000 }

  delegate :full_name, :nick_name, :company, :show_company, to: :user, prefix: true

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
