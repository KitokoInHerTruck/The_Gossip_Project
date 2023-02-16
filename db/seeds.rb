# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

City.destroy_all
User.destroy_all
Gossip.destroy_all

10.times do
    City.create!(
        name: Faker::Address.city,
        zip_code: Faker::Address.zip_code
    )
end

10.times do
    User.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      description: Faker::Lorem.sentence,
      password: "login",
      email: Faker::Internet.email,
      age: rand(18..99),
      city_id: City.all.sample.id
    )
  end
  
  20.times do
    Gossip.create!(
      title: Faker::Lorem.sentence,
      content: Faker::Lorem.paragraph,
      user_id: User.all.sample.id
    )
  end