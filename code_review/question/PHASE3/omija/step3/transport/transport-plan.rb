# 交通費を算出するクラス
class TransportPlan
  def initialize(single_trip_price)
    @single_trip_price = single_trip_price
  end

  # 割引料金を算出するメソッド
  def discount_fee
    0
  end

  # 追加料金を算出するメソッド
  def option_add_fee
    0
  end

  # 往復代を算出するメソッド
  def round_trip_price
    (@single_trip_price + option_add_fee - discount_fee) * 2
  end
end
