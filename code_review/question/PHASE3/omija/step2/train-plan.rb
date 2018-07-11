# 電車料金を算出するクラス
class TrainPlan
  def initialize(single_trip_price, student_discount_rate, is_green_car)
    @single_trip_price = single_trip_price
    @student_discount_rate = student_discount_rate
    @is_green_car = is_green_car
  end

  # 学割率が正しい値かどうか確認し、正しい値であれば学割率渡すメソッド
  def validate_student_discount_rate
    if @student_discount_rate <= 100 && @student_discount_rate.is_a?(Integer)
      @student_discount_rate
    else
      puts "学割の値は整数で0より大きく100未満の値を入れてください"
      exit(0)
    end
  end

  # 学割料金を算出するメソッド
  def student_discount_fee
    (@single_trip_price * validate_student_discount_rate) / 100
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
