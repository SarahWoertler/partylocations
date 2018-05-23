require 'faker'
require 'open-uri'

Location.destroy_all
User.destroy_all
# Availability.destroy_all

users = []
locations = []
a = 0
i = 0

10.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "yooooooooo",
    password_confirmation: "yooooooooo")
  user.save!

  p user
  users << user
end

10.times do

  location = Location.create(
  name: Faker::FamilyGuy.location,
  description: Faker::Lorem.paragraph,
  size: rand(10..2000),
  capacity: rand(5..200),
  price: rand(100..20000),
  lat: Faker::Address.latitude,
  lng: Faker::Address.longitude,
  location_type: ["Bar", "Restaurant", "Club", "Other"].sample,
  occasion: ["Wedding", "Birthday", "Corporate", "Family", "Other"].sample,
  accessible: ["true", "false"].sample == "true",
  catering: ["true", "false"].sample == "true",
  parking: ["true", "false"].sample == "true",
  smoking: ["true", "false"].sample == "true",
  music: ["true", "false"].sample == "true",
  user_id: users.sample.id
    )


  p location
  locations << location
end


10.times do

  365.times do
    avail = Availability.create!(
      location: locations[a],
      # user: nil,
      # user: users.sample,
      date: (Date.today + i.day),
      status: nil
      # status: ["pending", "accepted", "denied"].sample
      )
    i += 1
    p avail
  end

  a += 1
end
