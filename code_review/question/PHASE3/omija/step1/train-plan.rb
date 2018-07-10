# 電車料金を算出するクラス
class TrainPlan
  def initialize(single_trip_price, student_discount_rate, is_green_car)
    @single_trip_price = single_trip_price
    @student_discount_rate = student_discount_rate
    @is_green_car = is_green_car
  end

  # 学割料金を算出するメソッド
  def student_discount
    (@single_trip_price * @student_discount_rate).to_i
  end

  # グリーン車料金を算出するメソッド
  def green_car_fee
    @is_green_car ? 5000 : 0
  end

  # 往復代を算出するメソッド
  def round_trip_price
    (@single_trip_price - student_discount + green_car_fee) * 2
  end
end
