# 交通費の計算をするクラスを作成
class TrainPlan
  
  def initialize(basic_single_fare)
    @basic_single_fare = basic_single_fare
  end

  def student_discount_round_trip_fare_info
    "学割適用後の往復運賃は#{(@basic_single_fare * 0.8 * 2).round}円です"
  end

end

# 宿泊費を計算するクラスを作成
class HotelPlan

  attr_accessor :choose_smoking_room
  attr_accessor :choose_rank_of_room
  attr_accessor :choose_breakfast
  attr_accessor :choose_dinner

  def smoking_room_fee
    if self.choose_smoking_room == "yes"
      1000
    else
      0
    end
  end

  def rank_of_room_fee
    if self.choose_rank_of_room    == "gold"
      8000
    elsif self.choose_rank_of_room == "silver"
      5000
    elsif self.choose_rank_of_room == "bronze"
      3000
    else
      0
    end
  end

  def breakfast_fee
    if self.choose_breakfast == "yes"
      500
    else
      0
    end
  end

  def dinner_fee
    if self.choose_dinner == "yes"
      800
    else
      0
    end
  end

end

smoking_room = HotelPlan.new
rank_of_room = HotelPlan.new
breakfast    = HotelPlan.new
dinner       = HotelPlan.new

# smoking_roomの使用有無を選択。""内にyes / noを入力
smoking_room.choose_smoking_room = "no"

# 部屋のランクを選択。""内にgold / silver / bronze / normalのいずれかを入力
rank_of_room.choose_rank_of_room = "normal"

# 朝食の必要有無を選択。""内にyes / noを入力
breakfast.choose_breakfast = "no"

# 夕食の必要有無を選択。""内にyes / noを入力
dinner.choose_dinner = "no"

basic_hotel_fee = 5000
total_hotel_fee = basic_hotel_fee + smoking_room.smoking_room_fee + rank_of_room.rank_of_room_fee + breakfast.breakfast_fee + dinner.dinner_fee

puts "ホテルの宿泊料金は#{total_hotel_fee}円です。"
