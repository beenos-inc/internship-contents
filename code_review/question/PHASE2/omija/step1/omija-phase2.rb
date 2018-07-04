class TrainPlan
    STUDENT_DISCOUNT_COEFFICIENT = 0.2
    
    def initialize(single_trip_price)
        @single_trip_price = single_trip_price
    end

    def use_student_discount
        @single_trip_price = (@single_trip_price * (1 - STUDENT_DISCOUNT_COEFFICIENT)).to_i # PHASE.2 step.1 学割料金を求めるメソッドを完成させる
    end

    def get_round_trip_price # PHASE.2 step.1 往復代を求めるメソッドを追加する
        @single_trip_price
    end
end

train_plan = TrainPlan.new(12500)
train_plan.use_student_discount
puts "交通費: #{train_plan.get_round_trip_price}円"    

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

    # PHASE.2 step.1 喫煙可能部屋を使うメソッドを追加する
    def is_smoker
        @hotel_price += SMOKER_COST
    end

    # PHASE.2 step.1 ホテルのランクを選択するメソッドを追加する
    def select_hotel_rank(hotel_room_rank)
        if HOTEL_ROOM_RANK_ADD_FEES.fetch(hotel_room_rank, nil).nil?
            p "正しいランクを選択してください"
            exit(0) 
        else
            @hotel_price += HOTEL_ROOM_RANK_ADD_FEES[hotel_room_rank]
        end
    end

    # PHASE.2 step.1 朝食を食べるメソッドを追加する
    def has_breakfast
        @hotel_price += MEAL_ADD_FEES["breakfast"]
    end
 
    # PHASE.2 step.1 夕食を食べるメソッドを追加する
    def has_dinner
        @hotel_price += MEAL_ADD_FEES["dinner"]
    end

    def get_hotel_price
        @hotel_price
    end
end

hotel_plan = HotelPlan.new(5000)
hotel_plan.is_smoker
hotel_plan.select_hotel_rank("gold")
hotel_plan.has_breakfast
hotel_plan.has_dinner
puts "ホテル代: #{train_plan.get_round_trip_price}円"

class TravelPrice
    def initialize(hotel_price, round_trip_price)
        @hotel_price = hotel_price
        @single_trip_price = round_trip_price
    end

    def get_total_price
        # PHASE.2 step.1 配列の合計金額を求める処理を完成させる
        total_price = @hotel_price + @single_trip_price
        "旅費合計: #{total_price}円"
    end
end

travel_price = TravelPrice.new(hotel_plan.get_hotel_price, train_plan.get_round_trip_price)
puts travel_price.get_total_price