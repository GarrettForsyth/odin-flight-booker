class BookingsController < ApplicationController

  def new
    @flight = Flight.find(params[:flight_id])
    @bookings = []
    @passengers = []
    params[:booking][:number_of_passengers].to_i.times do |n|
      @bookings << Booking.new
      @passengers << Passenger.new
    end

    
  end

  def create
    logger.debug params
    if params[:bookings][:flight_id].present?
      params[:bookings][:passengers].each do |passenger|
        if passenger[:name].present? and passenger[:email].present?
          logger.debug "TESSST  #{passenger}"
          p = Passenger.create!(passenger_params(passenger))
          Booking.create!(flight: Flight.find(params[:bookings][:flight_id]),
                          passenger: p)
        end
      end
    end
    redirect_to bookings_path
  end

  def index
    @bookings = Booking.all
  end

  def passenger_params(my_params)
    my_params.permit(:name, :email)
  end

end
