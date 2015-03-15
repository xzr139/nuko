class CreateFollowActivities < ActiveRecord::Migration
  def change
    create_table :follow_activities do |t|
      t.integer :user_id
      t.integer :target_id
      t.string  :follow_type
      t.boolean :followed

      t.timestamps null: false
    end
  end
end
