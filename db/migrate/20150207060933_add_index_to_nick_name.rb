class AddIndexToNickName < ActiveRecord::Migration
  def self.up
    add_index :users, :nick_name, unique: true
  end

  def self.down
    remove_index :users, :nick_name
  end
end
