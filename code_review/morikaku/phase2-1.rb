# 交通費の計算をするクラスを作成
class TrainPlan
  
  attr_accessor :basic_single_fare

  def student_discount_single_fare
    (self.basic_single_fare * 0.8).round
  end

  def student_discount_round_trip_fare
    student_discount_single_fare * 2
  end

end

round_trip_fare = TrainPlan.new

# 片道の基本料金を入力
round_trip_fare.basic_single_fare = 12500

puts "学割適用後の往復運賃は#{round_trip_fare.student_discount_round_trip_fare}円です。"