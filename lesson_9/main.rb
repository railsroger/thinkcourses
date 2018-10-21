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
    puts 'Enter last station: '
    @last_station = gets.chomp
    @stations << Station.new(@first_station, @last_station)
    @routes << Route.new(@first_station, @last_station)
  rescue RuntimeError => e
    puts e.to_s
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
    @trains << if train_type == :cargo
                 CargoTrain.new(number, train_type)
               elsif train_type == :passenger
                 PassengerTrain.new(number, train_type)
               else
                 Train.new(number, train_type)
               end
  rescue RuntimeError => e
    puts e.to_s
    retry
  end

  puts "Trains #{@trains}"
end

# Create Station
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
    puts e.to_s
    retry
  end

  puts "Station creation complete #{@stations.last.name}"
end

# Blocks
def train_list
  @stations.each do |station|
    puts "Station name: #{station.name}"
    station.each_train do |train|
      puts "Train number: #{train.number},
      train type: #{train.type}, train count: #{train.railway_carriages.size}"
    end
  end
end

def list_wagon
  @trains.each do |train|
    train.each_carriages do |carriage, index|
      if type == :passenger
        puts "Number #{index}, type: #{carriage.type},
         busy: #{carriage.seats_count},
         free: #{carriage.free_place}"
      elsif type == :cargo
        puts "Number #{index}, type: #{carriage.type},
        busy: #{carriage.count},
        free: #{carriage.remaining_volume}"
      else
        return train
      end
    end
  end
end

p Station.all

if !Train.find('12345').nil?
  puts Train.find('12345')
else
  puts 'Поезд с таким номером не найден!'
end
