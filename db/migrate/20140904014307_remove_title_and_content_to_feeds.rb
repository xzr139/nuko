class RemoveTitleAndContentToFeeds < ActiveRecord::Migration
  def change
    remove_column :feeds, :title
    remove_column :feeds, :content
  end
end
