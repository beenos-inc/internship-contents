require "./hotel-plan.rb"
require "./transport/train-plan.rb"
require "./transport/airplane-plan.rb"
require "./transport/bus-plan.rb"
require "./travel-price.rb"

# 電車代算出インスタンス作成
train_plan = TrainPlan.new(
  single_trip_price: 12_500,
  use_student_discount: true,
  is_green_car: true,
  student_discount_rate: 20
)

# 飛行機代算出インスタンス作成
airplane_plan = AirplanePlan.new(
  single_trip_price: 12_500,
  use_student_discount: true,
  use_early_reservation: true,
  student_discount_rate: 20
)

# バス代算出インスタンス作成
bus_plan = BusPlan.new(
  single_trip_price: 12_500,
  use_student_discount: true,
  use_coupon_discount: true,
  student_discount_rate: 20
)

# ホテル代算出インスタンス作成
hotel_plan = HotelPlan.new(
  day_default_price: 5_000,
  hotel_room_rank: :gold,
  is_smoking_room: true,
  has_breakfast: true,
  has_dinner: true
)

# 旅費算出インスタンス作
travel_price = TravelPrice.new(
  train_rt_price: train_plan.round_trip_price,
  airplane_rt_price: airplane_plan.round_trip_price,
  bus_rt_price: bus_plan.round_trip_price,
  hotel_price: hotel_plan.hotel_price
)

# 旅費金額出力
travel_price.total_price
