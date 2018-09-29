class PassengerTrain < Train

  def add_carriages(carriage)
    if carriage.class == "Passenger"
      super
    end
  end
end
