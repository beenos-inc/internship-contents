require_relative "transport-plan.rb"

# 飛行機料金を算出するクラス
class AirplanePlan < TransportPlan
  def initialize(single_trip_price, student_discount_rate, use_early_reservation)
    @single_trip_price = single_trip_price
    @student_discount_rate = student_discount_rate
    @use_early_reservation = use_early_reservation
  end

  # 学割料金を算出するメソッド
  def student_discount_fee
    unless validate_discount_rate(@student_discount_rate)
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

  # 割引料金を算出するメソッド
  def discount_fee
    student_discount_fee + early_reservation_discount_fee
  end
end
