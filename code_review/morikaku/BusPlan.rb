# バス料金を計算するBusPlanクラス
class BusPlan
  def initialize(basic_bus_fare:, choose_coupon_discount:)
    @basic_bus_fare = basic_bus_fare
    @choose_coupon_discount = choose_coupon_discount
  end

  def bus_fare_include_coupon_discount
    (@choose_coupon_discount == "yes") ? (@basic_bus_fare * 0.9).round : @basic_bus_fare
  end
end