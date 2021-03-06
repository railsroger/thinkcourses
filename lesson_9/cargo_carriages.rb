class CargoCarriages < Carriage
  attr_reader :count

  def initialize(overall_volume, type = :cargo)
    @overall_volume = overall_volume
    @count = 0
    super
  end

  def take_the_volume_of(volume)
    @count += volume if volume > remaining_volume
  end

  def remaining_volume
    @overall_volume - @count
  end
end
