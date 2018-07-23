# 電車料金を算出するクラス
class TrainPlan
  def initialize(single_trip_price, student_discount_rate, is_green_car)
    @single_trip_price = single_trip_price
    @student_discount_rate = student_discount_rate
    @is_green_car = is_green_car
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

  # グリーン車料金を算出するメソッド
  def green_car_fee
    @is_green_car ? 5_000 : 0
  end

  # 往復代を算出するメソッド
  def round_trip_price
    (@single_trip_price - student_discount_fee + green_car_fee) * 2
  end
end
