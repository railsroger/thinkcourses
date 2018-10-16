class CargoCarriages < Carriage
  def initialize(overall_volume, type = :cargo)
    @overall_volume = overall_volume
    @volume_count = 0
  end

  def take_the_volume_of(volume)
    if volume > @overall_volume - @volume_count
        @volume_count += volume
    end
  end

  def occupied_volume
    @volume_count
  end

  def remaining_volume
    @overall_volume - @volume_count
  end
end
