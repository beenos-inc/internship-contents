#往復運賃の計算をするクラス（グリーン車を選択するメソッドを追加）
class TrainPlan
  def initialize(basic_single_fare:, choose_green_car:)
    @basic_single_fare = basic_single_fare
    @choose_green_car = choose_green_car
  end

  def student_discount_single_fare
    (@basic_single_fare * 0.8).round
  end

  def student_discount_single_fare_include_green_car_fare
    (@choose_green_car == "yes") ? student_discount_single_fare + 5000 : student_discount_single_fare
  end

  def student_discount_round_trip_fare_include_green_car_fare
    student_discount_single_fare_include_green_car_fare * 2
  end
end

