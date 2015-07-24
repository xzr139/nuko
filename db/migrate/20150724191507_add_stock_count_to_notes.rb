class AddStockCountToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :stock_count, :integer, default: 0
  end
end
