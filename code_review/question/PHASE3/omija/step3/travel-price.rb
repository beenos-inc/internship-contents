# 旅費合計を算出するクラス
class TravelPrice
  def initialize(train_rt_price:, airplane_rt_price:, bus_rt_price:, hotel_price:)
    @train_rt_price = train_rt_price
    @airplane_rt_price = airplane_rt_price
    @bus_rt_price = bus_rt_price
    @hotel_price = hotel_price
  end

  # 旅費合計を算出するメソッド
  def total_price
    puts "交通費: #{@train_rt_price + @airplane_rt_price + @bus_rt_price}円"
    puts "ホテル代: #{@hotel_price}円"
    puts "旅費合計: #{@train_rt_price + @airplane_rt_price + @bus_rt_price + @hotel_price}円"
  end
end
