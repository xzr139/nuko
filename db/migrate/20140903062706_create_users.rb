class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :facebook_id
      t.string :email
      t.string :full_name
      t.string :nick_name
      t.string :token
      t.timestamps
    end
  end
end
