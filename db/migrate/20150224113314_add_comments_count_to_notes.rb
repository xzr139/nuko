class AddCommentsCountToNotes < ActiveRecord::Migration
  def self.up
    add_column :notes, :comments_count, :integer, default: 0, null: false
  end

  def self.down
    remove_column :notes, :comments_count
  end
end
