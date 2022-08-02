FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    encrypted_password { "#{Faker::Internet.username}#{rand(999_999)}" }
  end
end
