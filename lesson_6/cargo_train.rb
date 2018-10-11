class CargoTrain < Train
  
  def add_carriages(carriage)
    super if carriage.class == "CargoCarriages"
  end
end
