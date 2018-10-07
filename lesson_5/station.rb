class Station

  attr_reader :name, :trains, :type
  include InstanceCounter

  @@all_stations = []

  def self.all
    @@all_stations
  end

  def initialize(name)
    @name = name
    @trains = []
    @@all_stations << self
  end

  def show_train_list
    @trains.each { |train| puts "Train - #{train.number} type - #{train.railway_carriages}" }
  end

  def reception_of_trains(train)
    @trains << train
  end

  def sending_a_train(train)
    @trains.delete(train)
  end

  def train_on_station(type)
    train_count = @trains.count { |train| train.train_type == type }
  end

end
