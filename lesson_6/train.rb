class Train

  attr_accessor :speed, :route, :route_station
  attr_reader :number, :railway_carriages, :current_station, :trains

  include CompanyName
  include InstanceCounter

  FORMAT_NUMBER = /^([a-z]|\d){3}-?([a-z]{2}|\d{2})$/i

  @@trains = {}

  def self.find(number)
    @@trains[number]
  end

  def initialize(number)
    @number = number
    @railway_carriages = []
    @speed = 0
    validate!
    @@trains[number] = self
  end

  def add_carriages(carriage)
    @railway_carriages << carriage if train_stopped?
  end

  def del_carriages(carriage)
    @railway_carriages.delete(carriage) if train_stopped?
  end

  def train_type
    if @carriage.is_a?(CargoCarriages)
      "Cargo"
    else
      "Passenger"
    end
  end

  def gain_speed(speed)
    self.speed += speed
  end

  def stop_train
    self.speed = 0
  end

  def train_stopped?
    self.speed.zero?
  end

  def itinerary
    route.route_station
  end

  def route_assignment
    @current_station = route.route_station[0]
  end

  def moving_forward
    if last_station? && current_station <= route.route_station.length
      @current_station += 1
      @current_station = route.route_station[current_station]
    end
  end

  def moving_back
    if first_station? && current_station > 0
      @current_station -= 1
      @current_station = route.route_station[current_station]
    end
  end

  def show_next_station
    route.route_station[@current_station + 1].name
  end

  def show_prev_station
    route.route_station[@current_station - 1].name
  end

  def valid?
    validate!
  rescue
    false
  end

  private

    def validate!
      raise 'Train number can not be empty' if number.empty?
      raise 'Train number can not be nil' if number.nil?
      raise 'The number must be at least 6 characters' if number.length < 6
      raise 'The number should not be longer than 6 characters' if number.length > 6
      raise 'The train number does not match the format' if number !~ FORMAT_NUMBER
      true
    end

    def last_station?
      route.route_station.last != current_station
    end

    def first_station?
      route.route_station[0] != current_station
    end
end
