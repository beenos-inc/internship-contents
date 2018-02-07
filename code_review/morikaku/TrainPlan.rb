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
end
