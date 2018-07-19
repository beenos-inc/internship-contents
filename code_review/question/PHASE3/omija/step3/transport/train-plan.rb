require_relative "transport-plan.rb"

# 電車料金を算出するクラス
class TrainPlan < TransportPlan
  def initialize(single_trip_price, use_student_discount, is_green_car, student_discount_rate)
    @single_trip_price = single_trip_price
    @use_student_discount = use_student_discount
    @student_discount_rate = student_discount_rate
    @is_green_car = is_green_car
    @array_discount_rate = set_discount
    @array_additional_option = set_additional
  end

  # 割引設定
  def set_discount
    set_discount_rate = []
    set_discount_rate << @student_discount_rate if @use_student_discount
  end

  # 追加設定
  def set_additional
    set_additional_option = []
    set_additional_option << 5_000 if @is_green_car
  end
end
