require "./hotel-plan.rb"
require "./transport/train-plan.rb"
require "./transport/air-plan.rb"
require "./transport/bus-plan.rb"
require "./travel-price.rb"

# 交通費を求めるメソッド
def transport_price
  # 電車代を求める
  train_plan = TrainPlan.new(12500, 20)
  train_plan.use_student_discount
  train_plan.use_green_car
  days_after_today = train_plan.set_use_date(2018, 7, 6)
  train_plan.get_early_bird_discount_rate(days_after_today)

  # 飛行機代を求める
  air_plan = AirPlan.new(100, 30)
  air_plan.use_student_discount

  # バス代を求める
  bus_plan = BusPlan.new(100, 10)
  bus_plan.use_student_discount

  # 交通費を求める
  puts "交通費:#{air_plan.get_price + bus_plan.get_price + train_plan.get_price}円"
  air_plan.get_price + bus_plan.get_price + train_plan.get_price
end

# ホテル代を求めるメソッド
def hotel_price
  hotel_plan = HotelPlan.new(5000)
  hotel_plan.is_smoker
  hotel_plan.select_hotel_rank("gold")
  hotel_plan.has_breakfast
  hotel_plan.has_dinner
  puts "ホテル代:#{hotel_plan.get_hotel_price}円"
  hotel_plan.get_hotel_price
end

# 旅費合計を求めるメソッド
def total_travel_price
  travel_price = TravelPrice.new(transport_price, hotel_price)
  travel_price.get_total_travel_price
end

puts "旅費合計:#{total_travel_price}円"
