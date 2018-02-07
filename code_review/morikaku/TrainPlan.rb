#往復運賃の計算をするクラス
class TrainPlan
  def initialize(basic_single_fare:)
    @basic_single_fare = basic_single_fare
  end

  def student_discount_single_fare
    (@basic_single_fare * 0.8).round
  end

  def student_discount_round_trip_fare
    student_discount_single_fare * 2
  end

  def student_discount_round_trip_fare_info
    "学割適用後の往復運賃は#{student_discount_round_trip_fare}円です"
  end
end
