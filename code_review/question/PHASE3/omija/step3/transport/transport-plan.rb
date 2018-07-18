require_relative "discount-fee.rb"
require_relative "additional-fee.rb"

# 交通費を算出するクラス
class TransportPlan
  def initialize(single_trip_price, student_discount_rate)
    @single_trip_price = single_trip_price
    @student_discount_rate = student_discount_rate
    @selected_discount = [:学割]
    @selected_additional = []
  end

  # 割引料金の取得を行うメソッド
  def discount_fee
    DiscountFee.new(@single_trip_price, @selected_discount, @student_discount_rate).discount_fee
  end

  # 追加料金の取得を行うメソッド
  def additional_fee
    AdditionalFee.new(@selected_additional).additional_fee
  end

  # 往復代を算出するメソッド
  def round_trip_price
    (@single_trip_price + additional_fee - discount_fee) * 2
  end
end
