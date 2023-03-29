# frozen_string_literal: true

FactoryBot.define do
  factory :quote do
    user
    book
    content { Faker::Lorem.paragraph_by_chars(number: 20) }
  end
end
