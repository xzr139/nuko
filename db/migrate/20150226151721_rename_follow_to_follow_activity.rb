class RenameFollowToFollowActivity < ActiveRecord::Migration
  def change
    rename_table :followers, :follow_activities
  end
end
