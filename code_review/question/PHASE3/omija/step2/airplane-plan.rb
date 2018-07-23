# 飛行機料金を算出するクラス
class AirplanePlan
  def initialize(single_trip_price, student_discount_rate, use_early_reservation)
    @single_trip_price = single_trip_price
    @student_discount_rate = student_discount_rate
    @use_early_reservation = use_early_reservation
  end

  # 割引率が1~99の整数かどうか確認するメソッド
  def validate_student_discount_rate
    @student_discount_rate.is_a?(Integer) && 0 < @student_discount_rate && @student_discount_rate < 100
  end

  # 学割料金を算出するメソッド
  def student_discount_fee
    unless validate_student_discount_rate
      puts "学割の値は整数で0より大きく100未満の値を入れてください"
      exit(0)
    end

    (@single_trip_price * @student_discount_rate) / 100
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
