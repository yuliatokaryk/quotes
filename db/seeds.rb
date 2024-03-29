# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |i|
  User.create(email: "user_#{i}@quotes.com", password: "user_#{1}", password_confirmation: "user_#{1}")
end

10.times do 
  Author.create(first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                date_of_birth: Faker::Date.between(from: '1500-01-01', to: '2002-01-01'),
                wikipedia_url: Faker::Internet.url,
                goodreads_url: Faker::Internet.url,
                user_id: User.pluck(:id).sample)
end

30.times do 
  Book.create(title: Faker::Book.title,
              year_of_publication: Faker::Number.within(range: 500..2022),
              wikipedia_url: Faker::Internet.url,
              goodreads_url: Faker::Internet.url,
              author_id: Author.pluck(:id).sample,
              user_id: User.pluck(:id).sample)
end

60.times do 
  Quote.create(content: Faker::Lorem.paragraph,
               user_id: User.pluck(:id).sample,
               source_type: 'Book',
               source_id: Book.pluck(:id).sample)
end

60.times do 
  Quote.create(content: Faker::Lorem.paragraph,
               user_id: User.pluck(:id).sample,
               source_type: 'Author',
               source_id: Author.pluck(:id).sample)
end
