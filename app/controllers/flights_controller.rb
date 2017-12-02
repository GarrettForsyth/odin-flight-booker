class FlightsController < ApplicationController

  def index
    @matching_flights = []
    if params[:flight].present?

      @matching_flights = Flight.all
      @number_of_passengers = params[:flight][:number_of_passengers]

      if params[:flight][:to_airport_id].present?
        @matching_flights =
          @matching_flights.where(to_airport: params[:flight][:to_airport_id])
      end



      if params[:flight][:from_airport_id].present?
        @matching_flights =
          @matching_flights.where(from_airport: params[:flight][:from_airport_id])
      end


      if params[:flight][:departure_time].present?
        @matching_flights =
          @matching_flights.where(departure_time: params[:flight][:departure_time][0..-5])
      end
    end
  end


  def flight_params
    params.require(:flight).permit(:to_airport_id,
                                   :from_airport_id,
                                   :number_of_passengers,
                                   :departure_time)
  end

end
