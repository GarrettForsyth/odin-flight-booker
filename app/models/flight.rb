class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: 'Airport'
  belongs_to :to_airport, class_name: 'Airport'
  has_many :bookings

  def self.all_departure_times
    Flight.all.select(:departure_time).map do |flight|
    end
  end

  def self.all_departing_flights
    Flight.all.select(:from_airport_id).distinct.map do |flight|
      Airport.find(flight.from_airport_id)
    end
  end
                                                        
  def self.all_arriving_flights
    Flight.all.select(:to_airport_id).distinct.map do |flight|
      Airport.find(flight.to_airport_id)
    end
  end

end
