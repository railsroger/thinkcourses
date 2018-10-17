require_relative 'company_name.rb'
require_relative 'instance_counter.rb'
require_relative 'train'
require_relative 'station'
require_relative 'route'
require_relative 'carriage'
require_relative 'cargo_carriages'
require_relative 'cargo_train'
require_relative 'passenger_carriages'
require_relative 'passenger_train'


@trains = []
@routes = []
@stations = []

# create Route
def create_route
  puts 'Enter first station: '
  begin
    @first_station = gets.chomp
    @stations << Station.new(@first_station)
    puts 'Enter last station: '
    @last_station = gets.chomp
    @stations << Station.new(@last_station)
    @routes << Route.new(@first_station, @last_station)

  rescue RuntimeError => e
    puts "#{e}"
    retry
  end

  puts "Route #{@routes}"
end

# create Train
def create_train
  begin
    puts 'Enter train number: '
    number = gets.chomp
    puts 'Enter train type: '
    train_type = gets.chomp

    if train_type == :cargo
      @trains << CargoTrain.new(number, train_type)
    elsif train_type == :passenger
      @trains << PassengerTrain.new(number, train_type)
    else
      @trains << Train.new(number, train_type)
    end

  rescue RuntimeError => e
    puts "#{e}"
    retry
  end

  puts "Trains #{@trains}"
end
#Create Station
def create_station
  begin
    puts 'Enter name station: '
    @station = gets.chomp
    if @stations.include?(@station)
      puts 'Station already exists'
    else
      @stations << Station.new(@station)
    end

  rescue RuntimeError => e
    puts "#{e}"
    retry
  end

  puts "Station creation complete #{@stations.last.name}"
end
# Blocks
def display_train_list
  @stations.each do |station|
      puts "Station name: #{station.name}"
      station.each_train do |train|
        puts "Train number: #{train.number}, train type: #{train.type}, train count: #{train.railway_carriages.size}"
      end
  end
end

def display_railway_carriages
  @trains.each do |train|
    train.each_carriages do |carriage, index|
      puts "Number #{index}, type: #{carriage.type}, busy: #{carriage.seats_count}, free: #{carriage.free_place}" if type == :passenger
      puts "Number #{index}, type: #{carriage.type}, busy: #{carriage.count}, free: #{carriage.remaining_volume}" if type == :cargo
    end
  end
end

p Station.all

if Train.find("12345") != nil
  puts Train.find("12345")
else
  puts 'Поезд с таким номером не найден!'
end
