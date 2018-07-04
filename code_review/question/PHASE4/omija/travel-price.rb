class TravelPrice
  def initialize(transport_price, hotel_price)
    @transport_price = transport_price
    @hotel_price = hotel_price
  end

  def get_total_travel_price
    # PHASE.2 step.1 配列の合計金額を求める処理を完成させる
    total_travel_price = @hotel_price + @transport_price
  end
end