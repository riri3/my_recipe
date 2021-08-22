# frozen_string_literal: true

class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :genre

  # 中間テーブルのrelation
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  # フォーム内でingredientsをネストする。動的に削除できるようallow_destroy: true記載。
  accepts_nested_attributes_for :ingredients, allow_destroy: true

  has_many :daily_menus, dependent: :destroy

  validates :name, presence: true

  attachment :image, destroy: false

  def calculated_ingredients
    ingredients = self.ingredients.to_a #[{id: 1, name: "tako",unit: 3, quantity: 1},[{id: 2, name: "tako",unit: 3, quantity: 1},[{id: 3, name: "ika",unit: 3, quantity: 1]
    #まずingredientsでnameが重複するものを選別しべつのarry  #[{id: 1, name: "tako",unit: 3, quantity: 1},[{id: 2, name: "tako",unit: 3, quantity: 1}]
    # ingredientsでかぶっているのを排除　#[[{id: 3, name: "ika",unit: 3, quantity: 1]
    #まとめたもののquantitlyを足し算,配列を書き換える　change_arr = #[name: "tako",unit: 6, quantity: 2}]
    arry  << change_arr  #[{name: "tako",unit: 6, quantity: 2},{id: 3, name: "ika",unit: 3, quantity: 1}]

  end

end
