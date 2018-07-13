require_relative "transport-plan.rb"
require_relative "discount-fee.rb"

# 電車料金を算出するクラス
class TrainPlan < TransportPlan
  def initialize(single_trip_price, student_discount_rate, is_green_car)
    @single_trip_price = single_trip_price
    @student_discount_rate = student_discount_rate
    @is_green_car = is_green_car
  end

  # 学割料金を算出するメソッド
  def student_discount_fee
    student_discount = DiscountFee.new(@single_trip_price, @student_discount_rate)
    student_discount.discount_fee_calculation
  end

  # グリーン車料金を算出するメソッド
  def green_car_fee
    @is_green_car ? 5_000 : 0
  end

  # 割引料金を算出するメソッド
  def discount_fee
    student_discount_fee
  end

  # 追加料金を算出するメソッド
  def option_add_fee
    green_car_fee
  end
end
