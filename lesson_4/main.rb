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


train1 = Train.new("12345")
train2 = Train.new("67890")
train3 = Train.new("09876")


route1 = Route.new("Minsk", "Moskow")
route2 = Route.new("Oslo", "Bergen")
route3 = Route.new("Chicago", "Miami")


p route1.add_other_station station3
p route2.add_other_station station1

p station1.reception_of_trains train1
p station1.reception_of_trains train3

p station1.sending_a_train train3

p train1.add_carriages("Cargo")
p train2.add_carriages("Cargo")
p train1.add_carriages("Passenger")
p train1.del_carriages("Cargo")

p train1.train_type

p station1.show_train_list

p train1.itinerary