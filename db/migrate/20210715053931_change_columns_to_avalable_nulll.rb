# frozen_string_literal: true

class ChangeColumnsToAvalableNulll < ActiveRecord::Migration[5.2]
  def change
    change_column :ingredients, :name, :string, null: true
    change_column :ingredients, :unit, :string, null: true
    change_column :ingredients, :quantity, :float, null: true
  end
end
