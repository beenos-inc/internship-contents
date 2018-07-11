# バス料金を算出するクラス
class BusPlan
  def initialize(single_trip_price, student_discount_rate, use_coupon_discount)
    @single_trip_price = single_trip_price
    @student_discount_rate = student_discount_rate
    @use_coupon_discount = use_coupon_discount
  end

  # 学割率が正しい値かどうか確認し、正しい値であれば学割率渡すメソッド
  def validate_student_discount_rate
    @student_discount_rate >= 0 && @student_discount_rate < 100 && @student_discount_rate.is_a?(Integer)
  end

  # 学割料金を算出するメソッド
  def student_discount_fee
    unless validate_student_discount_rate
      puts "学割の値は整数で0より大きく100未満の値を入れてください"
      exit(0)
    end

    (@single_trip_price * @student_discount_rate) / 100
  end

  # クーポン割引料金を算出するメソッド
  def coupon_discount_fee
    return 0 unless @use_coupon_discount
    (@single_trip_price * 0.1).to_i
  end

  # 往復代を算出するメソッド
  def round_trip_price
    (@single_trip_price - coupon_discount_fee - student_discount_fee) * 2
  end
end
