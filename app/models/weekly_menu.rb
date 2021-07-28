# frozen_string_literal: true

class WeeklyMenu < ApplicationRecord
  belongs_to :shopping_list
  # has_many :daily_menus, dependent: :destroy
end
