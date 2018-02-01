def round_trip_fare(basic_single_fare)
  student_discount  = basic_single_fare * 0.2
  total_single_fare = basic_single_fare - student_discount

  (total_single_fare * 2).round
end

def hotel_expences(basic_hotel_expences)
  optional_breakfast_fee         = 500
  optional_dinner_fee            = 800

  basic_hotel_expences + optional_breakfast_fee + optional_dinner_fee
end

# ()内には片道の基本料金を入力
round_trip_fare = round_trip_fare(12500)

# ()内にはホテルの基本料金を入力
hotel_expences = hotel_expences(5000)

puts "学割適用後の往復運賃は#{round_trip_fare}円です。"  #=> 学割適用後の往復運賃は20000円です。

puts "ホテルの宿泊料金は朝食・夕食代金合わせて#{hotel_expences}円です。"  #=> ホテルの宿泊料金は朝食・夕食代金合わせて6300円です。

puts "往復運賃とホテル代金の合計は#{round_trip_fare + hotel_expences}円です。"  #=> 往復運賃とホテル代金の合計は26300円です。