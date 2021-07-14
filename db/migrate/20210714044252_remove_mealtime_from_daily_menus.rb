class RemoveMealtimeFromDailyMenus < ActiveRecord::Migration[5.2]
  def change
    remove_column :daily_menus, :meal_time, :string
  end
end
