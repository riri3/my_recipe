class MealTime < ApplicationRecord

  has_many :daily_menus, dependent: :destroy

end
