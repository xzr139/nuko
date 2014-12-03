class AddFollowedToFollowers < ActiveRecord::Migration
  def change
    add_column :followers, :followed, :boolean
  end
end
