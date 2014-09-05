class Note < ActiveRecord::Base
  belongs_to :user
  validates :title,  length: { maximum: 43 }
end
