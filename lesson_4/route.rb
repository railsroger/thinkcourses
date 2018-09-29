class Route

  attr_reader :route_station, :station

  def initialize(first_station, last_station)
    @route_station = [first_station, last_station]
  end

  def add_other_station(station)
    @route_station.insert(-2, station) 
  end

  def delete_other_station(station)
    @route_station.delete(station)
  end
end
