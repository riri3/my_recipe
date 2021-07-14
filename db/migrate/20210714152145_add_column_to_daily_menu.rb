class AddColumnToDailyMenu < ActiveRecord::Migration[5.2]
  def change
    add_column :daily_menus, :meal_time_id, :integer, null: true
  end
end
