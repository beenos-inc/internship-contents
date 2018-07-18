require_relative "transport-plan.rb"

# バス料金を算出するクラス
class BusPlan < TransportPlan
  def initialize(single_trip_price, student_discount_rate, use_coupon_discount)
    @single_trip_price = single_trip_price
    @student_discount_rate = student_discount_rate
    @selected_discount = [:学割] << :クーポン if use_coupon_discount
    @selected_additional = []
  end
end
