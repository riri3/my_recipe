# frozen_string_literal: true

class ShoppingList < ApplicationRecord
  # has_many :weekly_menus, dependent: :destroy
  belongs_to :user

   validates :memo, presence: true

end
