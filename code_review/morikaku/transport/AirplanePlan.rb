require "./transport/TransportPlan"

# 飛行機の往復料金の計算（学割、早割含む）をするAirplanePlanクラス
class AirplanePlan < TransportPlan
  def initialize(basic_single_fare:, student_discount_rate:, choose_early_booking_discount:)
    @basic_single_fare             = basic_single_fare
    @student_discount_rate         = student_discount_rate
    @choose_early_booking_discount = choose_early_booking_discount
    check_rate_number
  end
  
  def check_rate_number
    if @student_discount_rate <= 0 || 100 < @student_discount_rate
      raise "学割の値は0より大きく100以下の値を入れてください。"
    end
  end

  def student_discount(fare)
    (fare * (1 - (@student_discount_rate / 100.0))).round
  end

  def early_booking_discount(fare)
    (@choose_early_booking_discount == "yes") ? (fare * 0.7).round : fare
  end

  def discount_fare
    @basic_single_fare - (early_booking_discount(student_discount(@basic_single_fare)))
  end

  def additional_fare
    0
  end
end