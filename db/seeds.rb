# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do 
  Author.create(first_name:Faker::Name.first_name,
                last_name:Faker::Name.last_name,
                date_of_birth:Faker::Date.between(from: '1500-01-01', to: '2002-01-01'),
                wikipedia_url:Faker::Internet.url,
                goodreads_url:Faker::Internet.url,
                user_id:Faker::Number.between(from: 1, to: User.all.count))
end
