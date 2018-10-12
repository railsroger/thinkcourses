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
station1 = Station.new("New-York")
station2 = Station.new("Boston")
station3 = Station.new("Los-Angeles")

route1 = Route.new("Minsk", "Moskow")
route2 = Route.new("Oslo", "Bergen")
route3 = Route.new("Chicago", "Miami")

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

p Station.all

if Train.find(number) != nil
  puts Train.find(number)
else
  puts 'Поезд с таким номером не найден!'
end
