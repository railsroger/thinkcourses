class PassengerTrain < Train

  def add_carriages(carriage)
    count = 1
    begin
      if carriage.class == "Passenger"
        super
        count += 1
      end
    end while count <= 5
  end
end
