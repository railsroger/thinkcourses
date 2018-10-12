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
  @trains << Train.new(number)

rescue RuntimeError => e
  puts "#{e}"
  retry
end
puts @trains

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

p Station.all

if Train.find("12345") != nil
  puts Train.find("12345")
else
  puts 'Поезд с таким номером не найден!'
end
