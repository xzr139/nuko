class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer     :note_id,     null: false
      t.integer     :comment_id,  null: false
      t.integer     :user_id,     null: false
      t.boolean     :liked,       default: false
      t.timestamps
    end
  end
end
