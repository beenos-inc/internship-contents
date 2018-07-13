require_relative "transport-plan.rb"
require_relative "discount-fee.rb"

# バス料金を算出するクラス
class BusPlan < TransportPlan
  def initialize(single_trip_price, student_discount_rate, use_coupon_discount)
    @single_trip_price = single_trip_price
    @student_discount_rate = student_discount_rate
    @use_coupon_discount = use_coupon_discount
  end

  # 学割料金を算出するメソッド
  def student_discount_fee
    student_discount = DiscountFee.new(@single_trip_price, @student_discount_rate)
    student_discount.discount_fee_calculation
  end

  # クーポン割引料金を算出するメソッド
  def coupon_discount_fee
    return 0 unless @use_coupon_discount
    coupon_discount = DiscountFee.new(@single_trip_price, 10)
    coupon_discount.discount_fee_calculation
  end

  # 割引料金を算出するメソッド
  def discount_fee
    student_discount_fee + coupon_discount_fee
  end
end
