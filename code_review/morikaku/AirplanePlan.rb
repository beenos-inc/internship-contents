# 飛行機の往復料金の計算（学割、早割含む）をするAirplanePlanクラス
class AirplanePlan
  def initialize(airplane_single_fare:, airplane_student_discount_rate:, choose_early_booking_discount:)
    @airplane_single_fare           = airplane_single_fare
    @airplane_student_discount_rate = airplane_student_discount_rate
    @choose_early_booking_discount  = choose_early_booking_discount
  end

  def student_discount_airplane_single_fare
    if @airplane_student_discount_rate > 0 && @airplane_student_discount_rate <= 100
      (@airplane_single_fare * (1 - @airplane_student_discount_rate / 100.0)).round
    else
      puts "学割の値は0より大きく100未満の値を入れてください。"
    end
  end

  def early_booking_discount_airplane_single_fare
    (@choose_early_booking_discount == "yes") ? (student_discount_airplane_single_fare * 0.7).round : student_discount_airplane_single_fare 
  end

  def airplane_round_trip_fare_include_discount
    early_booking_discount_airplane_single_fare * 2
  end
end