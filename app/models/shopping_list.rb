# frozen_string_literal: true

class ShoppingList < ApplicationRecord
  has_many :weekly_menu, dependent: :destroy
  belongs_to :users
end
