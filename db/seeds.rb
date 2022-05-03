# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "Faker"

puts "Cleaning up database..."

Review.destroy_all
Bid.destroy_all
Item.destroy_all
User.destroy_all
Compound.destroy_all

puts "Database cleaned"

compound = Compound.create(address: Faker::Address.street_name)
users = []
rand(5...10).times do
  users.push(User.create!({ nickname: Faker::Name.name, is_banned: 0, score: 0,
                            building_number: rand(1...5), room_number: rand(1...99),
                            compound: compound, phone_number: Faker::PhoneNumber.cell_phone,
                            avatar_url: "" }))
end

rand(20...100).times do
  Item.create!({ name: Faker::Food.dish, category: Faker::Food.ethnic_category,
                 condition: "", image_url: "", value: rand(10...100), request: "",
                 freebie: "", status: "avaliable", user: User.order(Arel.sql("RANDOM()")).first })
end

# Use this for random get a user
# User.order(Arel.sql('RANDOM()')).first
