require_relative "transport-plan.rb"

# 電車料金を算出するクラス
class TrainPlan < TransportPlan
  def initialize(single_trip_price, student_discount_rate, is_green_car)
    @single_trip_price = single_trip_price
    @student_discount_rate = student_discount_rate
    @is_green_car = is_green_car
  end

  # グリーン車料金を算出するメソッド
  def green_car_fee
    @is_green_car ? 5_000 : 0
  end

  # その他追加料金を算出するメソッド
  def other_add_fee
    green_car_fee
  end
end
