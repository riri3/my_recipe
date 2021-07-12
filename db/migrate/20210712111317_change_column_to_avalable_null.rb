class ChangeColumnToAvalableNull < ActiveRecord::Migration[5.2]
  def change
    change_column :recipes, :image_id, :string, null: true
  end
end
