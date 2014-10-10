class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer    :user_id
      t.integer    :note_id
      t.string     :content
      t.integer    :like_count
      t.datetime   :deleted_at
      t.timestamps
    end
  end
end
