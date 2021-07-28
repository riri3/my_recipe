# frozen_string_literal: true

class ChangeColumnAboutNull < ActiveRecord::Migration[5.2]
  def change
    change_column :daily_menus, :weekly_menu_id, :string, null: true
  end
end
