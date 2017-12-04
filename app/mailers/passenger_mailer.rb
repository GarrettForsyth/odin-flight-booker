class PassengerMailer < ApplicationMailer
  default from: 'odin-flight-booker@example.com'

  def thank_you_email(booking)

    @passenger = booking.passenger
    @flight = booking.flight
    @url = 'http:localhost:3000/bookings'

    mail(to: @passenger.email, subject: "Thank you!")

  end

end
