FactoryBot.define do
  factory :author do
    user
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    date_of_birth { Faker::Date.between(from: '1500-01-01', to: '2002-01-01') }
    wikipedia_url { Faker::Internet.url }
    goodreads_url { Faker::Internet.url }
  end
end
