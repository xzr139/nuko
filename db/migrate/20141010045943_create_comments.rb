class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer    :user_id,     null: false
      t.integer    :note_id,     null: false
      t.string     :content,     null: false
      t.timestamps

      t.index :user_id
      t.index :note_id
    end
  end
end
