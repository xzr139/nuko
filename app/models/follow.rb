class Follow < ActiveRecord::Base
  include PublicActivity::Model
  belongs_to :user
end
