require "./hotel-plan.rb"
require "./train-plan.rb"
require "./airplane-plan.rb"
require "./bus-plan.rb"
require "./travel-price.rb"

# 電車代算出インスタンス作成
train_plan = TrainPlan.new(100, 0.2, true)

# 飛行機代算出インスタンス作成
airplane_plan = AirplanePlan.new(100, 0.2, true)

# バス代算出インスタンス作成
bus_plan = BusPlan.new(100, 0.2, true)

# ホテル代算出インスタンス作成
hotel_plan = HotelPlan.new(5000, :gold, true, true, true)

# 旅費算出インスタンス作成
travel_price = TravelPrice.new(
  train_plan.round_trip_price,
  airplane_plan.round_trip_price,
  bus_plan.round_trip_price,
  hotel_plan.hotel_price
)

travel_price.total_price