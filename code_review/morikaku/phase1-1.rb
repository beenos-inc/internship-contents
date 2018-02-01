def calculate_transportation_expences(basic_single_fare)
  student_discount = basic_single_fare * 0.2
  total_single_fare = basic_single_fare - student_discount

  round_trip_fare = total_single_fare * 2

  puts "学割適用後の往復料金は#{round_trip_fare.round}円です。"
end

# ()内には片道の基本料金を入力
calculate_transportation_expences(12500)  #=> 学割適用後の往復料金は20000円です。