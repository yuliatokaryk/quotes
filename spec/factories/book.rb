# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    user
    author
    title { Faker::Book.title }
    year_of_publication { Faker::Number.within(range: 500..2022) }
    wikipedia_url { Faker::Internet.url }
    goodreads_url { Faker::Internet.url }
  end
end
