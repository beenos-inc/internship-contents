# 飛行機料金を計算するAirplanePlanクラス
class AirplanePlan
  def initialize(basic_airplane_fare:, choose_early_booking_discount:)
    @basic_airplane_fare = basic_airplane_fare
    @choose_early_booking_discount = choose_early_booking_discount
  end

  def airplane_fare_include_early_booking_discount
    (@choose_early_booking_discount == "yes") ? (@basic_airplane_fare * 0.7).round : @basic_airplane_fare
  end
end