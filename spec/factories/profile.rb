FactoryBot.define do
  factory :profile do
    user
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    nickname { Faker::Lorem.word }
    date_of_birth { Faker::Date.birthday }
  end
end
