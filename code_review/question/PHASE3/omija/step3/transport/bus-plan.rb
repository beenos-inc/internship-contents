require_relative "transport-plan.rb"

# バス料金を算出するクラス
class BusPlan < TransportPlan
  def initialize(single_trip_price, use_student_discount, use_coupon_discount, student_discount_rate)
    @single_trip_price = single_trip_price
    @use_coupon_discount = use_coupon_discount
    @use_student_discount = use_student_discount
    @student_discount_rate = student_discount_rate
    @array_discount_rate = set_discount
    @array_additional_option = []
  end

  # 割引設定
  def set_discount
    set_discount_rate = []
    set_discount_rate << 10 if @use_coupon_discount
    set_discount_rate << @student_discount_rate if @use_student_discount
  end
end
