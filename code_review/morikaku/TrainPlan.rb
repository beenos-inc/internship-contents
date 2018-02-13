#電車の往復料金の計算（学割、グリーン車追加料金含む）をするTrainPlanクラス
class TrainPlan
  def initialize(basic_single_fare:, student_discount_rate:, choose_green_car:)
    @basic_single_fare     = basic_single_fare
    @student_discount_rate = student_discount_rate
    @choose_green_car      = choose_green_car
  end

  def student_discount_fare
    if @student_discount_rate < 0 || 100 <= @student_discount_rate
      raise "学割の値は0より大きく100未満の値を入れてください。"
    end

    (@basic_single_fare * (1 - (@student_discount_rate / 100.0))).round
  end

  def green_car_fare
    (@choose_green_car == "yes") ? 5_000 : 0
  end

  def single_fare
    student_discount_fare + green_car_fare
  end

  def round_trip_fare
    single_fare * 2
  end
end

