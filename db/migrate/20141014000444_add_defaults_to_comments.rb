class AddDefaultsToComments < ActiveRecord::Migration
  def change
    change_column :comments, :note_id,    :integer, null: false
    change_column :comments, :user_id,    :integer, null: false
    change_column :comments, :content,    :text,    null: false
    change_column :comments, :like_count, :integer, default: 0
  end
end
