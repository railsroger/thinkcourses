class PassengerTrain < Train

  def add_carriages(carriage)
    super if carriage.class == "PassengerCarriages"
  end
end
