# frozen_string_literal: true

class AddColumnToDailyMenus2 < ActiveRecord::Migration[5.2]
  def change
    add_column :daily_menus, :setting_date, :datetime
  end
end
