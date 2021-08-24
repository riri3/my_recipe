# frozen_string_literal: true

class DailyMenu < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  belongs_to :meal_time
  # belongs_to :weekly_menu

  validates :recipe_id,  presence: true   # レシピ
  validates :meal_time_id, presence: true # 朝食/昼食/夕食
  validates :start_time, presence: true   # 日付

end
