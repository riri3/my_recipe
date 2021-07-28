# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.create!(id: 1,
              name: '和食')

Genre.create!(id: 2,
              name: '洋食')

Genre.create!(id: 3,
              name: '中華')

Genre.create!(id: 4,
              name: 'アジア/エスニック')

Genre.create!(id: 5,
              name: 'その他')

MealTime.create!(id: 1,
                 name: '朝食')

MealTime.create!(id: 2,
                 name: '昼食')

MealTime.create!(id: 3,
                 name: '夕食')
