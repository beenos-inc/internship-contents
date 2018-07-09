# 電車料金を算出するクラス
class TrainPlan
  def initialize(single_trip_price, student_discount_rate)
    @single_trip_price = single_trip_price
    @student_discount_rate = student_discount_rate
  end
  # 学割料金を算出するメソッド
  def student_discount
    (@single_trip_price * @student_discount_rate).to_i
  end

  # 往復代を算出するメソッド
  def round_trip_price
    (@single_trip_price - student_discount) * 2
  end
end
