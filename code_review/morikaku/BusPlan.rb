# バスの往復料金の計算（学割、クーポン割含む）をするBusPlanクラス
class BusPlan
  def initialize(single_fare:, student_discount_rate:, choose_coupon_discount:)
    @single_fare            = single_fare
    @student_discount_rate  = student_discount_rate
    @choose_coupon_discount = choose_coupon_discount
  end

  def student_discount_single_fare
    if @student_discount_rate > 0 && @student_discount_rate <= 100
      (@single_fare * (1 - (@student_discount_rate / 100.0))).round
    else
      puts "学割の値は0より大きく100未満の値を入れてください。"
    end
  end

  def coupon_discount_single_fare
    (@choose_coupon_discount == "yes") ? (student_discount_single_fare * 0.9).round : student_discount_single_fare
  end

  def round_trip_fare
    coupon_discount_single_fare * 2
  end
end