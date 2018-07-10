# 飛行機料金を算出するクラス
class AirplanePlan
  def initialize(single_trip_price, student_discount_rate, use_early_reservation)
    @single_trip_price = single_trip_price
    @student_discount_rate = student_discount_rate
    @use_early_reservation = use_early_reservation
  end

  # 学割料金を算出するメソッド
  def student_discount_fee
    (@single_trip_price * @student_discount_rate).to_i
  end

  # 早期予約割引料金を算出するメソッド
  def early_reservation_discount_fee
    return 0 unless @use_early_reservation
    (@single_trip_price * 0.3).to_i
  end

  # 往復代を算出するメソッド
  def round_trip_price
    (@single_trip_price - student_discount_fee - early_reservation_discount_fee) * 2
  end
end
