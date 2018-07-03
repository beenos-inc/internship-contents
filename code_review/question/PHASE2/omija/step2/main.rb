require "./hotel-plan.rb"
require "./train-plan.rb"
require "./travel-price.rb"

# 交通費を求める
train_plan = TrainPlan.new(12500)
train_plan.use_student_discount
puts "交通費: #{train_plan.get_round_trip_price}円"    

# ホテル代を求める
hotel_plan = HotelPlan.new(5000)
hotel_plan.is_smoker
hotel_plan.select_hotel_rank("gold")
hotel_plan.has_breakfast
hotel_plan.has_dinner
puts "ホテル代: #{hotel_plan.get_hotel_price}円"

# 旅費合計を求める
travel_price = TravelPrice.new(hotel_plan.get_hotel_price, train_plan.get_round_trip_price)
puts travel_price.get_total_price