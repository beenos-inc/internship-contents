require_relative "transport-plan.rb"

# バス料金を算出するクラス
class BusPlan < TransportPlan
  def initialize(single_trip_price, student_discount_rate, use_coupon_discount)
    @single_trip_price = single_trip_price
    @student_discount_rate = student_discount_rate
    @use_coupon_discount = use_coupon_discount
  end

  # クーポン割引料金を算出するメソッド
  def coupon_discount_fee
    return 0 unless @use_coupon_discount
    (@single_trip_price * 0.1).to_i
  end

  # その他割引料金を算出するメソッド
  def other_discount_fee
    coupon_discount_fee
  end
end
