# PHASE.1 step.1

# 電車の片道運賃
one_way_fare = 12500
# ホテル代の料金
hotel_fee = 5000
# 学割の係数
school_discount_coefficient = 0.2
# 朝食の代金
price_for_breakfast = 500
# 夕食の代金
price_for_dinner = 800

# 学割電車運賃を計算
# PHASE.1 step.1 学割のきいた片道運賃の変数名を設定する
discounted_one_way_fare = (one_way_fare * (1 - school_discount_coefficient)).to_i
# PHASE.1 step.1 往復運賃を求める処理を記述し、往復運賃の変数名を設定する
round_trip_fare = discounted_one_way_fare * 2
# PHASE.1. step.2 ホテル代の計算
total_hotel_fee_and_meals = hotel_fee + (price_for_breakfast + price_for_dinner)
# PHASE.1 step.2 往復料金とホテル代の合計
total_of_round_trip_fare_and_hotel_fee = round_trip_fare + total_hotel_fee_and_meals

puts "交通費：#{round_trip_fare}円"
puts "ホテル代：#{total_hotel_fee_and_meals}円"
puts "旅費：#{total_of_round_trip_fare_and_hotel_fee}円"
