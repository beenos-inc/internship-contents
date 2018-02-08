require "./TrainPlan"
require "./HotelPlan"
require "./AirplanePlan"
require "./BusPlan"

# 往復運賃とホテル料金を合計した旅費を計算するクラス
class TravelPlan
  def initialize(basic_single_fare:, choose_green_car:, basic_hotel_fee:, choose_smoking_room:, choose_rank_of_room:, choose_breakfast:, choose_dinner:, basic_airplane_fare:, choose_early_booking_discount:, basic_bus_fare:, choose_coupon_discount:)
    @basic_single_fare             = basic_single_fare
    @choose_green_car              = choose_green_car
    @basic_hotel_fee               = basic_hotel_fee
    @choose_smoking_room           = choose_smoking_room
    @choose_rank_of_room           = choose_rank_of_room
    @choose_breakfast              = choose_breakfast
    @choose_dinner                 = choose_dinner
    @basic_airplane_fare           = basic_airplane_fare
    @choose_early_booking_discount = choose_early_booking_discount
    @basic_bus_fare                = basic_bus_fare
    @choose_coupon_discount        = choose_coupon_discount
  end

  def total_train_fare
    train_plan = TrainPlan.new(
      basic_single_fare: @basic_single_fare,
      choose_green_car:  @choose_green_car
    )
    train_plan.student_discount_round_trip_fare_include_green_car_fare
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

  def total_airplane_fare
    airplane_plan = AirplanePlan.new(
      basic_airplane_fare:           @basic_airplane_fare,
      choose_early_booking_discount: @choose_early_booking_discount
    )
    airplane_plan.airplane_fare_include_early_booking_discount
  end

  def total_bus_fare
    bus_plan = BusPlan.new(
      basic_bus_fare:         @basic_bus_fare,
      choose_coupon_discount: @choose_coupon_discount
    )
    bus_plan.bus_fare_include_coupon_discount
  end

  def total_travel_fee
    total_train_fare + total_hotel_fee + total_airplane_fare + total_bus_fare
  end

  def total_train_fare_info
    "往復運賃（学割適用、グリーン車料金含む）は#{total_train_fare}円です。"
  end

  def total_hotel_fee_info
    "ホテル料金（各種オプション料金含む）は#{total_hotel_fee}円です。"
  end

  def total_airplane_fare_info
    "飛行機料金（早割含む）は#{total_airplane_fare}円です。"
  end

  def total_bus_fare_info
    "バス料金（クーポン割引含む）は#{total_bus_fare}円です。"
  end

  def total_travel_fee_info
    "旅費の合計金額は#{total_travel_fee}円です。"
  end
end