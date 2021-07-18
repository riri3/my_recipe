class RenameSettingDateToDailyMenus < ActiveRecord::Migration[5.2]
  def change
    rename_column :daily_menus, :setting_date, :start_time
  end
end
