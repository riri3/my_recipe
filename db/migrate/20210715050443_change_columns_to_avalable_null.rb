class ChangeColumnsToAvalableNull < ActiveRecord::Migration[5.2]
  def change
    change_column :daily_menus, :user_id, :string, null: true
  end
end
