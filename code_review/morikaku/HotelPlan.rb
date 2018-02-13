# ホテル料金（各種オプション料金含む）を計算するクラス
class HotelPlan
  def initialize(basic_fee:, choose_smoking_room:, choose_rank_of_room:, choose_breakfast:, choose_dinner:)
    @basic_fee           = basic_fee
    @choose_smoking_room = choose_smoking_room
    @choose_rank_of_room = choose_rank_of_room
    @choose_breakfast    = choose_breakfast
    @choose_dinner       = choose_dinner
  end

  def smoking_room_fee
    (@choose_smoking_room == "yes") ? 1_000 : 0
  end

  def rank_of_room_fee
    return 8_000 if @choose_rank_of_room == "gold"
    return 5_000 if @choose_rank_of_room == "silver"
    return 3_000 if @choose_rank_of_room == "bronze"
    0
  end

  def breakfast_fee
    (@choose_breakfast == "yes") ? 500 : 0
  end

  def dinner_fee
    (@choose_dinner == "yes") ? 800 : 0
  end

  def total_fee
    @basic_fee + smoking_room_fee + rank_of_room_fee + breakfast_fee + dinner_fee
  end
end
