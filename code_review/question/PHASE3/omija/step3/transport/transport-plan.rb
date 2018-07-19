require_relative "discount-fee.rb"
require_relative "additional-fee.rb"

# 交通費を算出するクラス
class TransportPlan
  def initialize(single_trip_price)
    @single_trip_price = single_trip_price
    @array_discount_rate = []
    @array_additional_option = []
  end

  # 割引料金の取得を行うメソッド
  def discount_fee
    DiscountFee.new(@single_trip_price, @array_discount_rate).discount_fee
  end

  # 追加料金の取得を行うメソッド
  def additional_fee
    AdditionalFee.new(@array_additional_option).additional_fee
  end

  # 往復代を算出するメソッド
  def round_trip_price
    (@single_trip_price + additional_fee - discount_fee) * 2
  end
end
