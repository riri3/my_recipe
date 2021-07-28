class AddUserIdColumnToShoppingLists < ActiveRecord::Migration[5.2]
  def change
    add_column :shopping_lists, :user_id, :integer
  end
end
