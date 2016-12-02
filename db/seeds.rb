# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Review.destroy_all
Booking.destroy_all
Offer.destroy_all
User.destroy_all

addresses = [
  {address: "89, Av. de Josep Tarradellas", zip_code: "08029", city: "Barcelona", country: "ES"},
  {address: "101, Avinguda Meridiana", zip_code: "08018", city: "Barcelona", country: "ES"},
  {address: "20, Carrer de Sant Antoni Maria Claret", zip_code: "08037", city: "Barcelona", country: "ES"},
  {address: "Herengracht 478", zip_code: "1017 CB", city: "Amsterdam", country: "NL"},
  {address: "Museumplein 6", zip_code: "1071 DJ", city: "Amsterdam", country: "NL"}
]

photos = [
  "https://media.licdn.com/mpr/mpr/jc/AAEAAQAAAAAAAAH2AAAAJGQyYWMwMTI0LTZkMzMtNDljNC04NDM5LWYyMjQ4NGEyMGE3MA.jpg",
  "http://kingofwallpapers.com/profile-pics/profile-pics-007.jpg",
  "http://2.bp.blogspot.com/-dZKdgsUW2y0/Une2h3IIVMI/AAAAAAAAC1o/tqJJFHKzHfY/s1600/katrina-kaif-Complete-Profile.jpg",
  "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSKUdsXnCb--XC0CK94IO934W9tfoatmAjBAEOsJOvhIULQmcUd",
  "http://www.celebbra.com/wp-content/uploads/2016/01/Nayantara-Height-Weight-Bra-Pics-Profile.jpg"
]

# 1.times { User.create(
#   email: Faker::Internet.email,
#   password: "password1",
#   remote_photo_url: photos[rand(0..4)],
#   name: Faker::Name.first_name,
#   first_name: :name
#   )}

# 1.times { Offer.create(
#   user_id: User.offset(rand(User.count)).first.id,
#   price: rand(15..100),
#   title: (Faker::Hipster.words(3)).join(" "),
#   description: (Faker::Hipster.sentences).join(" "),
#   seniority: Offer::SENIORITY[rand(0..Offer::SENIORITY.length)],
#   category: Offer::SKILLS_CATS[rand(0..Offer::SKILLS_CATS.length)],
#   address: address[rand(0..4)].address,
#   zip_code: address[rand(0..4)].zip_code,
#   city: address[rand(0..4)].city,
#   country: address[rand(0..4)].country
#   )}

# 1.times { Booking.create(
#   user_id: User.offset(rand(User.count)).first.id,
#   offer_id: Offer.offset(rand(Offer.count)).first.id,
#   date: Faker::Date.between(1.month.ago, 1.month.from_now)
#   )}

# 1.times { Review.create(
#   booking_id: Booking.offset(rand(Booking.count)).first.id,
#   title: (Faker::Hipster.words(3)).join(" "),
#   description: (Faker::Hipster.sentences).join(" "),
#   rating: rand(1..5)
#   )}
