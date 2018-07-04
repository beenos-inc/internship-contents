# 電車料金を算出するクラス
class TrainPlan
    STUDENT_DISCOUNT_COEFFICIENT = 0.2
    
    def initialize(single_trip_price)
        @single_trip_price = single_trip_price
    end

    # 学割料金を算出するメソッド
    def use_student_discount
        @single_trip_price = (@single_trip_price * (1 - STUDENT_DISCOUNT_COEFFICIENT)).to_i
    end

    # 往復代を算出するメソッド
    def round_trip_price 
        @single_trip_price
    end
end

train_plan = TrainPlan.new(12500)
train_plan.use_student_discount
puts "交通費: #{train_plan.round_trip_price}円"    

# ホテル料金を算出するクラス
class HotelPlan
    SMOKER_COST = 1000
    HOTEL_ROOM_RANK_ADD_FEES = {
        "normal" => 0,
        "bronze" => 3000,
        "silver" =>  5000,
        "gold" => 8000,
    }
    MEAL_ADD_FEES = {
        "breakfast" => 500,
        "dinner" => 800,
    }

    def initialize(price)
        @hotel_price = price
    end

    # 喫煙可能部屋を利用時のコストを取得するメソッド
    def is_smoker
        @hotel_price += SMOKER_COST
    end

    # ホテルランクのコストを取得するメソッド
    def select_hotel_rank(hotel_room_rank)
        if HOTEL_ROOM_RANK_ADD_FEES.fetch(hotel_room_rank, nil).nil?
            p "正しいランクを選択してください"
            exit(0) 
        else
            @hotel_price += HOTEL_ROOM_RANK_ADD_FEES[hotel_room_rank]
        end
    end

    # 朝食利用時のコストを取得するメソッド
    def has_breakfast
        @hotel_price += MEAL_ADD_FEES["breakfast"]
    end
 
    # 夕食利用時のコストを取得するメソッド
    def has_dinner
        @hotel_price += MEAL_ADD_FEES["dinner"]
    end

    # ホテル料金合計を算出するメソッド
    def hotel_price
        @hotel_price
    end
end

hotel_plan = HotelPlan.new(5000)
hotel_plan.is_smoker
hotel_plan.select_hotel_rank("gold")
hotel_plan.has_breakfast
hotel_plan.has_dinner
puts "ホテル代: #{hotel_plan.round_trip_price}円"

# 旅費合計を算出するクラス
class TravelPrice
    def initialize(hotel_price, round_trip_price)
        @hotel_price = hotel_price
        @round_trip_price = round_trip_price
    end

    # 旅費合計を算出するメソッド
    def total_price
        @total_price = @hotel_price + @round_trip_price
        "旅費合計: #{total_price}円"
    end
end

travel_price = TravelPrice.new(hotel_plan.hotel_price, train_plan.round_trip_price)
puts travel_price.total_price