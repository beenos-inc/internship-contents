# PHASE.2 step.1
# 交通費について
TRAIN_FARE_TO_TOKYO       = 12_500
DISCOUNT_RATE_FOR_STUDENT = 0.2

fare_for_student = (TRAIN_FARE_TO_TOKYO * (1 - DISCOUNT_RATE_FOR_STUDENT)).to_i
round_trip_fare  = fare_for_student * 2

# 宿泊費について
# 部屋の料金
HOTEL_ROOM_CHARGE_PER_DAY = 5_000
# 食事サービス料金
MEAL_SERVICE_CHARGE_LIST = {
  :breakfast => 500,
  :supper    => 800
}
# 喫煙ルーム使用料金
SMOKING_ROOM_USAGE_CHARGE = 1_000
# 部屋のグレード別料金
ROOM_GRADE_ADDITIONAL_CHARGE_LIST = {
  :normal => 0,
  :bronze => 3_000,
  :silver => 5_000,
  :gold   => 8_000
}

puts "Q. 食事は？\n"
with_breakfast = [true, false].sample.tap { |res| puts "A. 朝食あり\n" if     res }
                                     .tap { |res| puts "A. 朝食なし\n" unless res }
with_supper    = [true, false].sample.tap { |res| puts "A. 夕食あり\n" if     res }
                                     .tap { |res| puts "A. 夕食なし\n" unless res }
puts "Q. 喫煙ルーム/禁煙ルームは？\n"
smoking_allowed = [true, false].sample.tap { |res| puts "A. 喫煙ルーム\n" if     res }
                                      .tap { |res| puts "A. 禁煙ルーム\n" unless res }
puts "Q. 部屋のグレードは？\n"
room_grade = [:normal, :bronze, :silver, :gold].sample.tap { |res| puts "A. #{res.to_s}\n" }

hotel_fee = HOTEL_ROOM_CHARGE_PER_DAY
hotel_fee = hotel_fee + MEAL_SERVICE_CHARGE_LIST[:breakfast] if with_breakfast
hotel_fee = hotel_fee + MEAL_SERVICE_CHARGE_LIST[:supper]    if with_supper
hotel_fee = hotel_fee + SMOKING_ROOM_USAGE_CHARGE            if smoking_allowed
hotel_fee = hotel_fee + ROOM_GRADE_ADDITIONAL_CHARGE_LIST[room_grade]

total_costs = round_trip_fare + hotel_fee

puts "交通費：#{round_trip_fare}円\n"
puts "宿泊費：#{hotel_fee}円\n"
puts "旅費合計：#{total_costs}円"


# 交通費の計算クラス
class TrainPlan
end

# 宿泊費の計算クラス
class HotelPlan
end

# 旅費の計算クラス
class TravelPrice
end
