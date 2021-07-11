class WeeklyMenu < ApplicationRecord
  
  belongs_to :shopping_
  has_many :daily_menus, dependent: :destroy
  
end
