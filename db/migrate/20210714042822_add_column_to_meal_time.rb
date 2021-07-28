# frozen_string_literal: true

class AddColumnToMealTime < ActiveRecord::Migration[5.2]
  def change
    add_column :daily_menus, :meal_time, :string
  end
end
