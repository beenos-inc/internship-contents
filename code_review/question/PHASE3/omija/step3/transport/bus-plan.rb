require_relative "transport-plan.rb"

# バス料金を算出するクラス
class BusPlan < TransportPlan
  def initialize(single_trip_price, student_discount_rate, use_coupon_discount)
    @single_trip_price = single_trip_price
    @student_discount_rate = student_discount_rate
    @use_coupon_discount = use_coupon_discount
  end

  # 学生割引率が1~99の整数かどうか確認するメソッド
  def validate_discount_rate
    @student_discount_rate.is_a?(Integer) && 0 < @student_discount_rate && @student_discount_rate < 100
  end

  # 学割料金を算出するメソッド
  def student_discount_fee
    unless validate_discount_rate
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

  # 割引料金を算出するメソッド
  def discount_fee
    student_discount_fee + coupon_discount_fee
  end
end
