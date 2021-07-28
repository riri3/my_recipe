# frozen_string_literal: true

class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.integer :user_id,        null: false
      t.integer :genre_id,       null: false
      t.string :name,            null: false
      t.text :step,              null: false
      t.string :image_id,        null: false

      t.timestamps
    end
  end
end
