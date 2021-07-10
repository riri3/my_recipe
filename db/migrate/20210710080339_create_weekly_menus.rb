class CreateWeeklyMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :weekly_menus do |t|
      t.datetime :activated_at,     null: false
      t.datetime :inactivated_at,   null: false

      t.timestamps
    end
  end
end
