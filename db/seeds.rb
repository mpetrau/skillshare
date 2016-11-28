# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Booking.destroy_all
Offer.destroy_all
User.destroy_all

5.times { User.create(
  email: Faker::Internet.email,
  password: "password1",
  name: Faker::Name.first_name ,
  picture: Faker::Avatar.image )}

10.times { Offer.create(
  user_id: User.offset(rand(User.count)).first.id,
  price: rand(15..100),
  title: (Faker::Hipster.words(3)).join(" "),
  description: (Faker::Hipster.sentences).join(" "),
  seniority: Offer::SENIORITY[rand(0..4)],
  category: Offer::SKILLS_CATS[rand(0..4)],
  location: Faker::Address.city )}

20.times { Booking.create(
  user_id: User.offset(rand(User.count)).first.id,
  offer_id: Offer.offset(rand(Offer.count)).first.id,
  week: rand(0..52) )}
