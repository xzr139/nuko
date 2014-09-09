class AddDefaultValueToUsers < ActiveRecord::Migration
  def change
    change_column :stocks, :note_id, :integer, null: false
    change_column :stocks, :user_id, :integer, null: false
    change_column :stocks, :stocked, :boolean, default: false
  end
end
