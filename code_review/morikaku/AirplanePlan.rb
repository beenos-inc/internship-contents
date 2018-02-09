# 飛行機の往復料金の計算（学割、早割含む）をするAirplanePlanクラス
class AirplanePlan
  def initialize(single_fare:, student_discount_rate:, choose_early_booking_discount:)
    @single_fare                   = single_fare
    @student_discount_rate         = student_discount_rate
    @choose_early_booking_discount = choose_early_booking_discount
  end

  def student_discount_single_fare
    if @student_discount_rate > 0 && @student_discount_rate <= 100
      (@single_fare * (1 - (@student_discount_rate / 100.0))).round
    else
      puts "学割の値は0より大きく100未満の値を入れてください。"
    end
  end

  def early_booking_discount_single_fare
    (@choose_early_booking_discount == "yes") ? (student_discount_single_fare * 0.7).round : student_discount_single_fare
  end

  def airplane_round_trip_fare
    early_booking_discount_single_fare * 2
  end
end