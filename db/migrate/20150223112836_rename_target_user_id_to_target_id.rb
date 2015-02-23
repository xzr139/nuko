class RenameTargetUserIdToTargetId < ActiveRecord::Migration
  def change
    rename_column :followers, :target_user_id, :target_id
  end
end
