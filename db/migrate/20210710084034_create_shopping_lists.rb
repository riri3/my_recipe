# frozen_string_literal: true

class CreateShoppingLists < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_lists, &:timestamps
  end
end
