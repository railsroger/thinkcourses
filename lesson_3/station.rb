class Station

  attr_reader :name, :trains, :type

  def initialize(name)
    @name = name
    @trains = []
  end

  def reception_of_trains(train)
    @trains << train
  end

  def sending_a_train(train)
    @trains.delete(train)
  end

  def show_train_list
    @trains.each { |train| puts "Train - #{train.number} type - #{train.type} count - #{train.railway_carriage}" }
  end

  def train_on_station(type)
    @trains.count { |train| train.type == type }
    puts "Count trains to staion #{@name} type #{type} count #{train}"
  end
end
