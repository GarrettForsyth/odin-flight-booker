class Passenger < ApplicationRecord
  has_many :bookings

  accepts_nested_attributes_for :bookings
end
