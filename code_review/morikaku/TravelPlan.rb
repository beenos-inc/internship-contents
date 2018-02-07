require "./TrainPlan"
require "./HotelPlan"

# 往復運賃とホテル料金を合計した旅費を計算するクラス
class TravelPlan
  def initialize(basic_single_fare:, basic_hotel_fee:, choose_smoking_room:, choose_rank_of_room:, choose_breakfast:, choose_dinner:)
    @basic_single_fare   = basic_single_fare
    @basic_hotel_fee     = basic_hotel_fee
    @choose_smoking_room = choose_smoking_room
    @choose_rank_of_room = choose_rank_of_room
    @choose_breakfast    = choose_breakfast
    @choose_dinner       = choose_dinner
  end

  def total_train_fare
    train_plan = TrainPlan.new(basic_single_fare: @basic_single_fare)
    train_plan.student_discount_round_trip_fare
  end

  def total_hotel_fee
    hotel_plan = HotelPlan.new(
      basic_hotel_fee:     @basic_hotel_fee,
      choose_smoking_room: @choose_smoking_room,
      choose_rank_of_room: @choose_rank_of_room,
      choose_breakfast:    @choose_breakfast,
      choose_dinner:       @choose_dinner
    )
    hotel_plan.hotel_fee_include_options
  end

  def total_travel_fee
    total_train_fare + total_hotel_fee
  end

  def total_train_fare_info
    "学割適用後の往復運賃は#{total_train_fare}円です。"
  end

  def total_hotel_fee_info
    "ホテル料金は#{total_hotel_fee}円です。"
  end

  def total_travel_fee_info
    "旅費の合計金額は#{total_travel_fee}円です。"
  end
end