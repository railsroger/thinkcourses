class Station
  attr_accessor :trains_count
  attr_reader :name, :trains, :type

  def initialize(name)
    @name = name
    @trains = []
    @trains_count = 0
  end

  def reception_of_trains(train)
    @trains << train
  end

  def sending_a_train(train)
    @trains.delete(train)
  end

  def train_on_station(type)
    @trains.each { |train| trains_count += 1 if train.type == type }
  end
end
