class AddMemoToShoppingList < ActiveRecord::Migration[5.2]
  def change
    add_column :shopping_lists, :memo, :integer
  end
end
