# バスの往復料金の計算（学割、クーポン割含む）をするBusPlanクラス
class BusPlan
  def initialize(bus_single_fare:, bus_student_discount_rate:, choose_coupon_discount:)
    @bus_single_fare           = bus_single_fare
    @bus_student_discount_rate = bus_student_discount_rate
    @choose_coupon_discount    = choose_coupon_discount
  end

  def student_discount_bus_single_fare
    if @bus_student_discount_rate > 0 && @bus_student_discount_rate <= 100
      (@bus_single_fare * (1 - @bus_student_discount_rate / 100.0)).round
    else
      puts "学割の値は0より大きく100未満の値を入れてください。"
    end
  end

  def coupon_discount_bus_single_fare
    (@choose_coupon_discount == "yes") ? (student_discount_bus_single_fare * 0.9).round : student_discount_bus_single_fare
  end

  def bus_round_trip_fare_include_discount
    coupon_discount_bus_single_fare * 2
  end
end