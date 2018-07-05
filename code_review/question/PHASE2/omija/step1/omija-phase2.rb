# 電車料金を算出するクラス
class TrainPlan
  def initialize(single_trip_price, student_discount_rate)
    @single_trip_price = single_trip_price
    @student_discount_rate = student_discount_rate
  end

  def checked_argumet_type
    p @single_trip_price.kind_of?
  end

  # 学割料金を算出するメソッド
  def student_discount
    (@single_trip_price * @student_discount_rate).to_i
  end

  # 往復代を算出するメソッド
  def round_trip_price
    (@single_trip_price - student_discount) * 2
  end
end

# ホテル料金を算出するクラス
class HotelPlan
  SMOKER_COST = 1000
  HOTEL_ROOM_RANK_ADD_FEES = {
    normal: 0,
    bronze: 3000,
    silver:  5000,
    gold: 8000,
  }
  MEAL_ADD_FEES = {
    breakfast: 500,
    dinner: 800,
  }

  def initialize(day_default_price, hotel_room_rank, is_smoker, has_breakfast, has_dinner)
    @day_default_price = day_default_price
    @hotel_room_rank = hotel_room_rank
    @is_smoker = is_smoker
    @has_breakfast = has_breakfast
    @has_dinner = has_dinner
  end

  # ホテルランクのコストを取得するメソッド
  def select_hotel_rank
    if HOTEL_ROOM_RANK_ADD_FEES.fetch(@hotel_room_rank, nil).nil?
      p "正しいランクを選択してください"
      exit(0) 
    else
      HOTEL_ROOM_RANK_ADD_FEES[@hotel_room_rank]
    end
  end

  # 喫煙可能部屋を利用時のコストを取得するメソッド
  def smoker_cost
    SMOKER_COST
  end

  # 朝食利用時のコストを取得するメソッド
  def breakfast_cost
    MEAL_ADD_FEES["breakfast"]
  end

  # 夕食利用時のコストを取得するメソッド
  def dinner_cost
    MEAL_ADD_FEES["dinner"]
  end

  # ホテル料金合計を算出するメソッド
  def hotel_price
    option_cost = 0
    option_cost += select_hotel_rank
    option_cost += smoker_cost if @is_smoker
    option_cost += breakfast_cost if @has_breakfast
    option_cost += dinner_cost if @has_dinner
    @day_default_price + option_cost
  end
end

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

train_plan = TrainPlan.new("a", 0.2)
hotel_plan = HotelPlan.new(5000, "gold", true, true, true)
travel_price = TravelPrice.new(train_plan.round_trip_price, hotel_plan.hotel_price)
travel_price.total_price