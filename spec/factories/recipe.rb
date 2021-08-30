FactoryBot.define do
  factory :recipe do
    user_id { Faker::Lorem.characters(number: 20) }
    name { Faker::Lorem.characters(number: 20) }
    genre_id { Faker::Lorem.characters(number: 20) }
    step { Faker::Lorem.characters(number: 20) }
    user
  end
end
