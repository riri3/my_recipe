class Genre < ApplicationRecord
  
  has_many :recipes, presence: true, dependent: :destroy
  
end
