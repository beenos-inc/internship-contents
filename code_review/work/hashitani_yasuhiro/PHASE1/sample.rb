# PHASE.1 step.1

# 電車の片道運賃
one_way_fare = 12500
# 学割の係数
school_discount_coefficient = 0.2

# 学割電車運賃を計算
# PHASE.1 step.1 学割のきいた片道運賃の変数名を設定する
discounted_one_way_fare = (one_way_fare * (1 - school_discount_coefficient)).to_i
# PHASE.1 step.1 往復運賃を求める処理を記述し、往復運賃の変数名を設定する
round trip = discounted_one_way_fare * 2

puts "交通費：#{round trip}円"
