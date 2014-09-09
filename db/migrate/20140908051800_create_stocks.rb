class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.integer    :note_id
      t.integer    :user_id
      t.boolean    :stoked
      t.timestamps
    end
  end
end
