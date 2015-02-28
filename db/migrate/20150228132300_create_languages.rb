class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name
      t.string :name_jp
      t.string :locale
      t.boolean :interface_flag, default: false

      t.timestamps null: false
    end
  end
end
