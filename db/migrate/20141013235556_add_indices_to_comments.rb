class AddIndicesToComments < ActiveRecord::Migration
  def change
    add_index :comments, :user_id
    add_index :comments, :note_id
  end
end
