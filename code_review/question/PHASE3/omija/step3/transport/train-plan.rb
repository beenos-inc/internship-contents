require_relative "transport-plan.rb"

# 電車料金を算出するクラス
class TrainPlan < TransportPlan
  def initialize(single_trip_price, student_discount_rate, is_green_car)
    @single_trip_price = single_trip_price
    @student_discount_rate = student_discount_rate
    @selected_discount = [:学割]
    @selected_additional = [] << :グリーン車 if is_green_car
  end
end
