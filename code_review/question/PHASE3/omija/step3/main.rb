require "./hotel-plan.rb"
require "./transport/train-plan.rb"
require "./transport/airplane-plan.rb"
require "./transport/bus-plan.rb"
require "./travel-price.rb"

# 飛行機代算出インスタンス作成
airplane_plan = AirplanePlan.new(12_500, 20, true)

# 電車代算出インスタンス作成
train_plan = TrainPlan.new(12_500, 20, true)

# バス代算出インスタンス作成
bus_plan = BusPlan.new(12_500, 20, true)

# ホテル代算出インスタンス作成
hotel_plan = HotelPlan.new(5_000, :gold, true, true, true)

# # 旅費算出インスタンス作成
travel_price = TravelPrice.new(train_plan.round_trip_price, airplane_plan.round_trip_price, bus_plan.round_trip_price, hotel_plan.hotel_price)

# # 旅費金額出力
travel_price.total_price
