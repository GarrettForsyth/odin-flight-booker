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
          p = Passenger.create!(passenger_params(passenger))
          b = Booking.create!(flight: Flight.find(params[:bookings][:flight_id]),
                          passenger: p)
          
          # Send a thank you for booking email

          PassengerMailer.thank_you_email(b).deliver_now
        end
      end
    end
    #redirect_to bookings_path
  end

  def index
    @bookings = Booking.all
  end

  def passenger_params(my_params)
    my_params.permit(:name, :email)
  end

end
