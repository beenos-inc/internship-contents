require "./transport/TransportPlan"

# バスの往復料金の計算（学割、クーポン割含む）をするBusPlanクラス
class BusPlan < TransportPlan
  def initialize(basic_single_fare:, student_discount_rate:, choose_coupon_discount:)
    @basic_single_fare      = basic_single_fare
    @student_discount_rate  = student_discount_rate
    @choose_coupon_discount = choose_coupon_discount
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

  def coupon_discount(fare)
    (@choose_coupon_discount == "yes") ? (fare * 0.9).round : fare
  end

  def discount_fare
    @basic_single_fare - (coupon_discount(student_discount(@basic_single_fare)))
  end

  def additional_fare
    0
  end
end