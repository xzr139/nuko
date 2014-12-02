class AddFollowedToFollowers < ActiveRecord::Migration
  def change
    add_column :followers, :follwed, :boolean
  end
end
