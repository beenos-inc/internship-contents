class TravelPrice
  def initialize(hotel_price, train_price, air_price, bus_price)
    @hotel_price = hotel_price
    @train_price = train_price
    @air_price = air_price
    @bus_price = bus_price
  end

  def get_total_price
    # PHASE.2 step.1 配列の合計金額を求める処理を完成させる
    total_price = @hotel_price + @train_price + @air_price + @bus_price
    "旅費合計: #{total_price}円"
  end
end
