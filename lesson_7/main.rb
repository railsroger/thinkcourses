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

# create Train
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

  # Add wagon
  if train_type == :cargo
    puts 'Enter volume: '
    volume = gets.chomp
    @trains.add_carriages(CargoCarriages.new(volume))
    puts "Attached. Train #{@train.name} - #{@train.railway_carriages.size}"
  elsif train_type == :passenger
    puts 'Enter seats: '
    seats = gets.chomp
    @trains.add_carriages(PassengerCarriages.new(seats))
    puts "Attached. Train #{@train.name} - #{@train.railway_carriages.size}"
  else
    puts 'No wagon!'
  end

rescue RuntimeError => e
  puts "#{e}"
  retry
end
puts "Trains #{@trains}"

#Create Station
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

# Blocks
@stations.each do |station|
    puts "Station name: #{station.name}"
    station.all_train do |train|
      puts "Train number: #{train.number}, train type: #{train.type}, train count: #{train.railway_carriages.size}"
      train.show_carriage do |carriage|
        puts "Number #{carriage.number}, type: #{carriage.type}, busy: #{carriage.busy_the_place}, free: #{carriage.free_place}" if type == :passenger
        puts "Number #{carriage.number}, type: #{carriage.type}, busy: #{carriage.occupied_volume}, free: #{carriage.remaining_volume}" if type == :cargo
      end
    end
end

p Station.all

if Train.find("12345") != nil
  puts Train.find("12345")
else
  puts 'Поезд с таким номером не найден!'
end
