# frozen_string_literal: true

class MealTime < ApplicationRecord
  has_many :daily_menus, dependent: :destroy
end
