class Route

  attr_reader :route_station, :station
  include InstanceCounter

  def initialize(first_station, last_station)
    @route_station = [first_station, last_station]
  end

  def add_other_station(station)
    @route_station.insert(-2, station)
  end

  def delete_other_station(station)
    @route_station.delete(station)
  end

  def stations_list
    @route_station.each { |station| station }
  end
end
