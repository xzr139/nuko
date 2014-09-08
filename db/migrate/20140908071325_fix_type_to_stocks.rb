class FixTypeToStocks < ActiveRecord::Migration
  def change
    rename_column :stocks, :stoked, :stocked
  end
end
