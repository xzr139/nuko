class Stock < ActiveRecord::Base
  include PublicActivity::Model

  belongs_to :user
  belongs_to :note
end
