# 旅費合計を算出するクラス
class TravelPrice
    def initialize(round_trip_price, hotel_price)
      @round_trip_price = round_trip_price
      @hotel_price = hotel_price
    end
  
    # 旅費合計を算出するメソッド
    def total_price
      puts "交通費: #{@round_trip_price}円"
      puts "ホテル代: #{@hotel_price}円"
      puts "旅費合計: #{@round_trip_price + @hotel_price}円"
    end
  end