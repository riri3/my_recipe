class CreateDailyMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :daily_menus do |t|
      t.integer :user_id,        null: false
      t.integer :recipe_id,      null: false
      t.integer :weekly_menu_id, null: false
      t.text :memo

      t.timestamps
    end
  end
end
