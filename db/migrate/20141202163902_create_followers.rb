class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.integer     :user_id
      t.integer     :target_user_id
      t.timestamps
    end
  end
end
