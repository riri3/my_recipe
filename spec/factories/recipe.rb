FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number: 20) }
    email { Faker::Lorem.characters(number: 20) }
    password { Faker::Lorem.characters(number: 20) }
    password_confirmation { Faker::Lorem.characters(number: 20) }
    user
  end

  factory :recipe do
    user_id { Faker::Lorem.characters(number: 20) }
    name { Faker::Lorem.characters(number: 20) }
    genre_id { Faker::Lorem.characters(number: 20) }
    step { Faker::Lorem.characters(number: 20) }
    user
  end
end
