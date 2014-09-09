class ChangeFacebookIdToUsers < ActiveRecord::Migration
  def change
    change_column :users, :facebook_id, :string, null: false
  end
end
