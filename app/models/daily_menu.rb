# frozen_string_literal: true

class DailyMenu < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  belongs_to :meal_time
  # belongs_to :weekly_menu

  validates :recipe_id,  presence: true
  validates :meal_time_id, presence: true
  validates :start_time, presence: true

end
