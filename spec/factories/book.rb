FactoryBot.define do
  factory :book do
    user
    title { Faker::Book.title }
    year_of_publication { Faker::Number.within(range: 500..2022) }
    wikipedia_url { Faker::Internet.url }
    goodreads_url { Faker::Internet.url }
    author_id { Faker::Number.between(from: 1, to: Author.all.count) }
  end
end
