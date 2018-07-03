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
 
  # 戻り値用メソッド
  def get_hotel_price
    @hotel_price
  end
end
