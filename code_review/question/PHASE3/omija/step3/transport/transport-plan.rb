# 交通費を算出するクラス
class TransportPlan
  def initialize(single_trip_price)
    @single_trip_price = single_trip_price
  end

  # 割引率が1~99の整数かどうか確認するメソッド
  def validate_discount_rate(discount_rate)
    discount_rate.is_a?(Integer) && 0 < discount_rate && discount_rate < 100
  end

  # 割引料金を算出するメソッド
  def discount_fee
    0
  end

  # 追加料金を算出するメソッド
  def add_fee
    0
  end

  # 往復代を算出するメソッド
  def round_trip_price
    (@single_trip_price + add_fee - discount_fee) * 2
  end
end
