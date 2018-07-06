require "./hotel-plan.rb"
require "./train-plan.rb"
require "./travel-price.rb"

train_plan = TrainPlan.new(12_500, 0.2)
hotel_plan = HotelPlan.new(5000, :gold, true, true, true)
travel_price = TravelPrice.new(train_plan.round_trip_price, hotel_plan.hotel_price)
travel_price.total_price