class AddIndexesToStocks < ActiveRecord::Migration
  def change
    add_index :stocks, :note_id
    add_index :stocks, :user_id
  end
end
