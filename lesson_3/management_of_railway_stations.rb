require './station.rb'
require './route.rb'
require './train.rb'

puts "Go, go, go!"

station1 = Station.new("Bronks")
station2 = Station.new("Bruklin")
station3 = Station.new("New-York")
station4 = Station.new("LA")
station5 = Station.new("San-Francisco")

route1 = Route.new(station1, station5)
route1.add_other_station(station3)
route1.add_other_station(station2)
route1.station
route1.delete_other_station(station2)
route1.delete_other_station(station5)
route1.delete_other_station(station4)
route1.route_station

train1 = Train.new(2285,"passenger", 15)
train2 = Train.new(2355, "cargo", 27)
train3 = Train.new(3678,"passenger", 23)
train4 = Train.new(4689, "cargo", 31)

train1.route_assignment(route1)
train1.moving_forward(station4)
train1.moving_back(station2)

station4.train_on_station
station2.train_on_station

station4.reception_of_trains(train2)
station4.reception_of_trains(train3)
station4.reception_of_trains(train4)

station4.train_on_station("cargo")
station5.train_on_station("passenger")
train2.moving_back
train1.moving_back