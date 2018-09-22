class Train

  attr_accessor :speed, :route, :route_station
  attr_reader :number, :type, :railway_carriage, :current_station

  def initialize(number, type, railway_carriage)
    @number = number
    @type = type
    @railway_carriage = railway_carriage
    @speed = 0
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

  def show_route_station
    route.route_station
  end

  def itinerary
    route.route_station
  end

  def route_assignment
    @current_station = route.route_station[0]
  end

  def moving_forward
    if route.route_station.last != current_station && current_station <= route.route_station.length
      @current_station += 1
      @current_station = route.route_station[current_station]
    end
  end

  def moving_back
    if route.route_station[0] != current_station && current_station > 0
      @current_station -= 1
      @current_station = route.route_station[current_station]
    end
  end

  def show_next_station
    puts "Next station #{route.route_station[@current_station + 1].name}"
  end

  def show_prev_station
    puts "Previous station #{route.route_station[@current_station - 1].name}"
  end
end
