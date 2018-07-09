# バス料金を算出するクラス
class BusPlan
  def initialize(
    single_trip_price,
    student_discount_rate,
    use_coupon_discount
  )
    @single_trip_price = single_trip_price
    @student_discount_rate = student_discount_rate
    @use_coupon_discount = use_coupon_discount
  end

  # 学割料金を算出するメソッド
  def student_discount_fee
    (@single_trip_price * @student_discount_rate).to_i
  end

  # 早期予約割引料金を算出するメソッド
  def coupon_discount_fee
    coupon_discount_rate = 0.1
    (@single_trip_price * coupon_discount_rate).to_i if @use_coupon_discount
  end

  # 往復代を算出するメソッド
  def round_trip_price
    (@single_trip_price - coupon_discount_fee - student_discount_fee) * 2
  end
end
