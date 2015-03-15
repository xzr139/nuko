class RemoveFollowTypeToFollowers < ActiveRecord::Migration
  def self.up
    remove_column :followers, :follow_type
  end

  def self.down
    add_column :followers, :follow_type
  end
end
