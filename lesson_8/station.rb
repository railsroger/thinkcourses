class Station
  STATION_FORMAT = /^[а-яa-z0-9]/i

  attr_reader :name, :trains, :type
  include InstanceCounter

  @all_stations = []

  def self.all
    @all_stations
  end

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @all_stations << self
  end

  def each_train
    trains.each { |train| yield(train) if block_given? }
  end

  def reception_of_trains(train)
    @trains << train
  end

  def sending_a_train(train)
    @trains.delete(train)
  end

  def train_on_station(type)
    @trains.count { |train| train.type == type }
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  private

  def validate!
    raise 'Station name can not be empty!' if name.empty?
    raise 'Station name must be longer than 3 characters' if name.length < 3
    raise 'Must not be longer than 12 characters' if name.length > 12
    raise 'Station name does not match the format' if name !~ STATION_FORMAT

    true
  end
end
