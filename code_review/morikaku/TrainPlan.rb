#電車の往復料金の計算（学割、グリーン車追加料金含む）をするTrainPlanクラス
class TrainPlan
  def initialize(single_fare:, student_discount_rate:, choose_green_car:)
    @single_fare           = single_fare
    @student_discount_rate = student_discount_rate
    @choose_green_car      = choose_green_car
  end

  def student_discount_single_fare
    if @student_discount_rate > 0 && @student_discount_rate <= 100
      (@single_fare * (1 - (@student_discount_rate / 100.0))).round
    else
      puts "学割の値は0より大きく100未満の値を入れてください。"
    end
  end

  def green_car_fare
    (@choose_green_car == "yes") ? 5_000 : 0
  end

  def student_discount_single_fare_include_green_car_fare
    student_discount_single_fare + green_car_fare
  end

  def train_round_trip_fare
    student_discount_single_fare_include_green_car_fare * 2
  end
end

