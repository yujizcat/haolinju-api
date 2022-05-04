# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

puts "Cleaning up database..."

Review.destroy_all
Bid.destroy_all
Item.destroy_all
User.destroy_all
Compound.destroy_all

puts "Database cleaned"

compound = Compound.create(address: Faker::Address.street_name)

puts "Seeding users"
users = []
50.times do
  users.push(User.create!({ nickname: Faker::Name.name, is_banned: false, score: 0,
                            building_number: rand(1...5), room_number: rand(1...99),
                            compound: compound, phone_number: Faker::PhoneNumber.cell_phone,
                            avatar_url: Faker::Avatar.image(slug: "my-own-slug", size: "100x100") }))
end

puts "Seeding items"

# Standards
conditions = ["Brand new", "Almost new", "In working condition", "Broken"]
item_names = [Faker::Appliance.equipment, Faker::Music.instrument, Faker::Camera.brand_with_model]





puts "Seeding items:home appliances"
# the first one is static
item = Item.new({ name: Faker::Appliance.equipment, category: "Home Appliances",
  condition: conditions.sample, image_url: "", value: 1, request: item_names.sample,
  is_freebie: [true, false].sample, status: "avaliable", user: User.order(Arel.sql("RANDOM()")).first })
item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save!

rand(20...50).times do
  item_names = [Faker::Appliance.equipment, Faker::Music.instrument, Faker::Camera.brand_with_model]
  item = Item.new({ name: Faker::Appliance.equipment, category: "Home Appliances",
                 condition: conditions.sample, image_url: "", value: 1, request: item_names.sample,
                 is_freebie: [true, false].sample, status: "avaliable", user: User.order(Arel.sql("RANDOM()")).first })
  item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
  item.save
  item.save!
end





puts "Seeding items:musical instruments"
# the first one is static
item = Item.new({ name: Faker::Music.instrument, category: "Musical Instruments",
  condition: conditions.sample, image_url: "", value: 1, request: item_names.sample,
  is_freebie: [true, false].sample, status: "avaliable", user: User.order(Arel.sql("RANDOM()")).first })
item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save!

rand(20...50).times do
  item_names = [Faker::Appliance.equipment, Faker::Music.instrument, Faker::Camera.brand_with_model]
  item = Item.new({ name: Faker::Music.instrument, category: "Musical Instruments",
                 condition: conditions.sample, image_url: "", value: 1, request: item_names.sample,
                 is_freebie: [true, false].sample, status: "avaliable", user: User.order(Arel.sql("RANDOM()")).first })
  item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
  item.save!
end


# Use this for random get a user
# User.order(Arel.sql('RANDOM()')).first
