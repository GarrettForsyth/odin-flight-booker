# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

# Create Fake Airports
Airport.create!(code: "SFO")
Airport.create!(code: "NYC")

98.times do |n|
  code = Faker::Address.city
  Airport.create!(code: code)
end

# Create Random Flights Between Airports
airports = Airport.all
50.times do |n|
  flight_between = airports.sample(2)
  from = flight_between[0]
  to = flight_between[1]
  ti = Faker::Time.forward(7) # Random time 7 days ahead
  tf = Faker::Time.between(ti, ti+1) 
  Flight.create!(from_airport: from,
                 to_airport: to,
                 departure_time: ti,
                 arrival_time: tf)
end
