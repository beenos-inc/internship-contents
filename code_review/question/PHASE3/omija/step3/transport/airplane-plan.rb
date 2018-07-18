require_relative "transport-plan.rb"

# 飛行機料金を算出するクラス
class AirplanePlan < TransportPlan
  def initialize(single_trip_price, student_discount_rate, use_early_reservation)
    @single_trip_price = single_trip_price
    @student_discount_rate = student_discount_rate
    @selected_discount = [:学割] << :早期予約 if use_early_reservation
    @selected_additional = []
  end
end
