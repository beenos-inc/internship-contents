require_relative "transport-plan.rb"

# 飛行機料金を算出するクラス
class AirplanePlan < TransportPlan
  def initialize(single_trip_price, use_student_discount, use_early_reservation, student_discount_rate)
    @single_trip_price = single_trip_price
    @use_early_reservation = use_early_reservation
    @use_student_discount = use_student_discount
    @student_discount_rate = student_discount_rate
    @array_discount_rate = set_discount
    @array_additional_option = []
  end

  # 割引設定
  def set_discount
    set_discount_rate = []
    set_discount_rate << 30 if @use_early_reservation
    set_discount_rate << @student_discount_rate if @use_student_discount
  end
end
