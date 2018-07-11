# 交通費を算出するクラス
class TransportPlan
  def initialize(single_trip_price, student_discount_rate)
    @single_trip_price = single_trip_price
    @student_discount_rate = student_discount_rate
  end

  # 学割率が0~99の整数かどうか確認するメソッド
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

  # その他割引料金を算出するメソッド
  def other_discount_fee
    0
  end

  # その他追加料金を算出するメソッド
  def other_add_fee
    0
  end

  # 往復代を算出するメソッド
  def round_trip_price
    (@single_trip_price + other_add_fee - other_discount_fee - student_discount_fee) * 2
  end
end
