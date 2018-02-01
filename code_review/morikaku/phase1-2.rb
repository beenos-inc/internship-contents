def calculate_transportation_expences(basic_single_fare)
  student_discount  = basic_single_fare * 0.2
  total_single_fare = basic_single_fare - student_discount

  round_trip_fare = (total_single_fare * 2).round
end

# ()内には片道の基本料金を入力
transportation_expences = calculate_transportation_expences(12500)
puts "学割適用後の往復合計金額は#{transportation_expences}円です。"  #=> 学割適用後の往復合計金額は20000円です。


def calculate_hotel_expences(basic_hotel_expences)
  optional_breakfast_fee         = 500
  optional_dinner_fee            = 800
  total_breakfast_and_dinner_fee = optional_breakfast_fee + optional_dinner_fee

  total_hotel_expences = basic_hotel_expences + total_breakfast_and_dinner_fee
end

# ()内にはホテルの基本料金を入力
hotel_expences = calculate_hotel_expences(5000)
puts "ホテルの宿泊料金は朝食・夕食代金合わせて#{hotel_expences}円です。"  #=> ホテルの宿泊料金は朝食・夕食代金合わせて6300円です。

puts "交通費とホテル代金の合計は#{transportation_expences + hotel_expences}円です。"  #=> 交通費とホテル代金の合計は26300円です。