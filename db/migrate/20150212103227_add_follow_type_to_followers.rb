class AddFollowTypeToFollowers < ActiveRecord::Migration
  def self.up
    add_column :followers, :follow_type, :string
  end

  def self.down
    remove_column :followers, :follow_type, :string
  end
end
