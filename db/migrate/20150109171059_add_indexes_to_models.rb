class AddIndexesToModels < ActiveRecord::Migration
  def change
    add_index :followers, :user_id
    add_index :likes, [:note_id, :comment_id, :user_id]
    add_index :notes, :user_id
  end
end
