require_relative "transport-plan.rb"
require_relative "discount-fee.rb"

# 飛行機料金を算出するクラス
class AirplanePlan < TransportPlan
  def initialize(single_trip_price, student_discount_rate, use_early_reservation)
    @single_trip_price = single_trip_price
    @student_discount_rate = student_discount_rate
    @use_early_reservation = use_early_reservation
  end

  # 学割料金を算出するメソッド
  def student_discount_fee
    student_discount = DiscountFee.new(@single_trip_price, @student_discount_rate)
    student_discount.discount_fee_calculation
  end

  # 早期予約割引料金を算出するメソッド
  def early_reservation_discount_fee
    return 0 unless @use_early_reservation
    early_reservation_discount = DiscountFee.new(@single_trip_price, 30)
    early_reservation_discount.discount_fee_calculation
  end

  # 割引料金を算出するメソッド
  def discount_fee
    student_discount_fee + early_reservation_discount_fee
  end
end
