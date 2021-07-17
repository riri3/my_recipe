class DailyMenu < ApplicationRecord

  belongs_to :user
  belongs_to :recipe
  belongs_to :meal_time
  # belongs_to :weekly_menu

  def start_time
    self.setting_date
  end

end
