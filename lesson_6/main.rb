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

p route1.add_other_station station3
p route2.add_other_station station1

p station1.reception_of_trains train1
p station1.reception_of_trains train3

p station1.sending_a_train train3

p train1.add_carriages("Cargo")
p train2.add_carriages("Cargo")
p train1.add_carriages("Passenger")
p train1.add_carriages("Passenger")
p train1.del_carriages("Cargo")

p train1.train_type

p station1.show_train_list

p Station.all

if Train.find("12345") != nil
  puts Train.find("12345")
else
  puts 'Поезд с таким номером не найден!'
end
