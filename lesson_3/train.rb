class Train

  attr_accessor :speed
  attr_reader :number, :type, :railway_carriage, :speed_now, :route, :current_station, :station_id

  def initialize(number, type, railway_carriage)
    @number = number
    @type = type
    @railway_carriage = railway_carriage
    @speed = 0
    @station_id = 0
  end

  def gain_speed
    self.speed += speed
  end

  def stop_train
    self.speed = 0
  end

  def add_railway_carriage
    if self.speed == 0
      @railway_carriage += 1
    end
  end

  def del_railway_carriage
    if self.speed == 0
      @railway_carriage -= 1
    end
  end

  def itinerary
    route.route_station
  end

  def route_assignment
    @current_station = route.route_station[0]
  end

  def moving_forward
    if route.route_station.last != current_station && station_id <= route.route_station.length
      @station_id += 1
      @current_station = route.route_station[station_id]
    end
  end

  def moving_back
    if route.route_station[0] != current_station && station_id > 0
      @station_id -= 1
      @current_station = route.route_station[station_id]
    end
  end
end
