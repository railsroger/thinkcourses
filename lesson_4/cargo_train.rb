class CargoTrain < Train

  def add_carriages(carriage)
    if carriage.class == "Cargo"
      super
    end
  end
end
