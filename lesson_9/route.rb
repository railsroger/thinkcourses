class Route
  attr_reader :route_station, :station
  include InstanceCounter
  include Validation

  validate :route_station, :type, Station

  def initialize(first_station, last_station)
    validate!
    @route_station = [first_station, last_station]
  end

  def add_other_station(station)
    @route_station.insert(-2, station)
  end

  def delete_other_station(station)
    @route_station.delete(station)
  end

  def validate!
    raise 'Route cannot be empty' if route_station.empty?

    true
  end
end
