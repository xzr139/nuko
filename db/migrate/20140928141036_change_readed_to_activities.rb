class ChangeReadedToActivities < ActiveRecord::Migration
  def change
    rename_column :activities, :readed, :unread
  end
end
