class AddReadFlagToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :readed, :boolean, default: false
  end
end
