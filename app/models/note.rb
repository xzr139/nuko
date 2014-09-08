class Note < ActiveRecord::Base
  belongs_to :user
  validates :title,  length: { maximum: 43 }
  acts_as_taggable
end
