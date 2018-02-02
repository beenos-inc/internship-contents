# 交通費の計算をするクラスを作成
class TrainPlan
  def initialize(basic_single_fare)
    @basic_single_fare = basic_single_fare
  end

  def student_discount_single_fare
    (@basic_single_fare * 0.8).round
  end

  def student_discount_round_trip_fare
    student_discount_single_fare * 2
  end

  def student_discount_round_trip_fare_info
    "学割適用後の往復運賃は#{student_discount_round_trip_fare}円です"
  end
end

# 宿泊費を計算するクラスを作成
class HotelPlan
  def initialize(basic_hotel_fee:, choose_smoking_room:, choose_rank_of_room:, choose_breakfast:, choose_dinner:)
    @basic_hotel_fee     = basic_hotel_fee
    @choose_smoking_room = choose_smoking_room
    @choose_rank_of_room = choose_rank_of_room
    @choose_breakfast    = choose_breakfast
    @choose_dinner       = choose_dinner
  end

  def smoking_room_fee
    if @choose_smoking_room == "yes"
      1000
    else
      0
    end
  end

  def rank_of_room_fee
    if @choose_rank_of_room    == "gold"
      8000
    elsif @choose_rank_of_room == "silver"
      5000
    elsif @choose_rank_of_room == "bronze"
      3000
    else
      0
    end
  end

  def breakfast_fee
    if @choose_breakfast == "yes"
      500
    else
      0
    end
  end

  def dinner_fee
    if @choose_dinner == "yes"
      800
    else
      0
    end
  end

  def total_hotel_fee_info
    "ホテルの宿泊料金は#{@basic_hotel_fee + smoking_room_fee + rank_of_room_fee + breakfast_fee + dinner_fee}円です。"
  end
end