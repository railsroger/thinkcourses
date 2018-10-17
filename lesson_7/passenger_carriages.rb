class PassengerCarriages < Carriage

  attr_reader :seats_count

  def initialize(total_of_seats, type = :passenger)
    @total_of_seats = total_of_seats
    @seats_count = 0
    super
  end

  def take_the_place_of
    @seats_count += 1 if @total_of_seats > @seats_count
  end

  def free_place
    @total_of_seats - @seats_count
  end
end
