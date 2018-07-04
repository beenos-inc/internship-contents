require "./hotel-plan.rb"
require "./train-plan.rb"
require "./air-plan.rb"
require "./bus-plan.rb"
require "./travel-price.rb"

# 電車代を求める
train_plan = TrainPlan.new(100)
train_plan.use_student_discount(20)
train_plan.use_green_car
puts "電車代： #{train_plan.get_train_price}円"

# 飛行機代を求める
air_plan = AirPlan.new(100)
air_plan.use_student_discount(30)
puts "飛行機代： #{air_plan.get_air_price}円"

# バス代を求める
bus_plan = BusPlan.new(100)
bus_plan.use_student_discount(10)
puts "バス代： #{bus_plan.get_bus_price}円"

# ホテル代を求める
hotel_plan = HotelPlan.new(5000)
hotel_plan.is_smoker
hotel_plan.select_hotel_rank("gold")
hotel_plan.has_breakfast
hotel_plan.has_dinner
puts "ホテル代： #{hotel_plan.get_hotel_price}円"

# 旅費合計を求める
travel_price = TravelPrice.new(
  hotel_plan.get_hotel_price,
  train_plan.get_train_price,
  air_plan.get_air_price,
  bus_plan.get_bus_price,
  )
puts travel_price.get_total_price
