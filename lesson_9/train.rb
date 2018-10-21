class Train
  attr_accessor :speed, :route, :route_station
  attr_reader :number, :type, :carriages, :current_station, :trains

  include CompanyName
  include InstanceCounter
  include Validation
  extend Accessors

  FORMAT_NUMBER = /^([a-z]|\d){3}-?([a-z]{2}|\d{2})$/i

  validate :number, :format, FORMAT_NUMBER
  validate :presence

  @trains = {}

  def self.find(number)
    @@trains[number]
  end

  def initialize(number, type)
    @number = number
    @type = type
    validate!
    @carriages = []
    @speed = 0
    @trains[number] = self
  end

  def each_carriages
    if block_given?
      carriages.each_with_index { |carriage, index| yield(carriage, index) }
    else
      carriages
    end
  end

  def add_carriages(carriage)
    @carriages << carriage if train_stopped?
  end

  def del_carriages(carriage)
    @carriages.delete(carriage) if train_stopped?
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
    return if last_station? && current_station <= route.route_station.length

    @current_station += 1
    @current_station = route.route_station[current_station]
  end

  def moving_back
    return if first_station? && current_station > 0

    @current_station -= 1
    @current_station = route.route_station[current_station]
  end

  def show_next_station
    route.route_station[@current_station + 1].name
  end

  def show_prev_station
    route.route_station[@current_station - 1].name
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  protected

  def last_station?
    route.route_station.last != current_station
  end

  def first_station?
    route.route_station[0] != current_station
  end

  def validate!
    raise 'Train number can not be nil' if number.nil?
    raise 'The number must be at least 6 characters' if number.length < 6
    raise 'Not be longer than 6 characters' if number.length > 6
    raise 'Does not match the format' if number !~ FORMAT_NUMBER
    raise 'The train type can not be nil' if type.nil?
    raise 'No type specified' if type != :cargo && type != :passenger

    true
  end
end
