class Recipe < ApplicationRecord

  belongs_to :user
  belongs_to :genre

  #中間テーブルのrelation
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  #フォーム内でingredientsをネストする。動的に削除できるようallow_destroy: true記載。
  accepts_nested_attributes_for :ingredients, allow_destroy: true

  has_many :daily_menus, dependent: :destroy




  attachment :image, destroy: false

end
