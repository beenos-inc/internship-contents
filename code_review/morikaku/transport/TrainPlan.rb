require "./transport/TransportPlan"

# 電車の往復料金の計算（学割、グリーン車追加料金含む）をするTrainPlanクラス
class TrainPlan < TransportPlan
  def initialize(basic_single_fare:, student_discount_rate:, choose_green_car:)
    @basic_single_fare     = basic_single_fare
    @student_discount_rate = student_discount_rate
    @choose_green_car      = choose_green_car
    check_rate_number
  end
  
  def check_rate_number
    if @student_discount_rate <= 0 || 100 < @student_discount_rate
      raise "学割の値は0より大きく100以下の値を入れてください。"
    end
  end

  def discount_fare
    (@basic_single_fare * (@student_discount_rate / 100.0)).round
  end

  def additional_fare
    (@choose_green_car == "yes") ? 5_000 : 0
  end
end