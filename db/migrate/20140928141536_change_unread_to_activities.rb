class ChangeUnreadToActivities < ActiveRecord::Migration
  def change
    change_column :activities, :unread, :boolean, default: true
  end
end
