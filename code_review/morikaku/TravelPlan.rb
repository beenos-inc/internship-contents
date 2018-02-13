require "./TrainPlan"
require "./HotelPlan"
require "./AirplanePlan"
require "./BusPlan"

# 電車、飛行機、バス料金とホテル料金を合計した旅費を計算するTravelPlanクラス
class TravelPlan
  def initialize(train_single_fare:, train_student_discount_rate:, choose_green_car:, basic_hotel_fee:, choose_smoking_room:, choose_rank_of_room:, choose_breakfast:, choose_dinner:, airplane_single_fare:, airplane_student_discount_rate:, choose_early_booking_discount:, bus_single_fare:, bus_student_discount_rate:, choose_coupon_discount:)
    @train_single_fare              = train_single_fare
    @train_student_discount_rate    = train_student_discount_rate
    @choose_green_car               = choose_green_car
    @basic_hotel_fee                = basic_hotel_fee
    @choose_smoking_room            = choose_smoking_room
    @choose_rank_of_room            = choose_rank_of_room
    @choose_breakfast               = choose_breakfast
    @choose_dinner                  = choose_dinner
    @airplane_single_fare           = airplane_single_fare
    @airplane_student_discount_rate = airplane_student_discount_rate
    @choose_early_booking_discount  = choose_early_booking_discount
    @bus_single_fare                = bus_single_fare
    @bus_student_discount_rate      = bus_student_discount_rate
    @choose_coupon_discount         = choose_coupon_discount
  end

  def total_train_fare
    train_plan = TrainPlan.new(
      basic_single_fare:     @train_single_fare,
      student_discount_rate: @train_student_discount_rate,
      choose_green_car:      @choose_green_car
    )
    train_plan.round_trip_fare
  end

  def check_train_student_discount_rate
    rate_number = TrainPlan.new(
      basic_single_fare:     @train_single_fare,
      student_discount_rate: @train_student_discount_rate,
      choose_green_car:      @choose_green_car
    )
    rate_number.check_rate_number
  end

  def total_hotel_fee
    hotel_plan = HotelPlan.new(
      basic_fee:           @basic_hotel_fee,
      choose_smoking_room: @choose_smoking_room,
      choose_rank_of_room: @choose_rank_of_room,
      choose_breakfast:    @choose_breakfast,
      choose_dinner:       @choose_dinner
    )
    hotel_plan.total_fee
  end

  def total_airplane_fare
    airplane_plan = AirplanePlan.new(
      basic_single_fare:             @airplane_single_fare,
      student_discount_rate:         @airplane_student_discount_rate,
      choose_early_booking_discount: @choose_early_booking_discount
    )
    airplane_plan.round_trip_fare
  end

  def check_airplane_student_discount_rate
    rate_number = AirplanePlan.new(
      basic_single_fare:             @airplane_single_fare,
      student_discount_rate:         @airplane_student_discount_rate,
      choose_early_booking_discount: @choose_early_booking_discount
    )
    rate_number.check_rate_number
  end

  def total_bus_fare
    bus_plan = BusPlan.new(
      basic_single_fare:      @bus_single_fare,
      student_discount_rate:  @bus_student_discount_rate,
      choose_coupon_discount: @choose_coupon_discount
    )
    bus_plan.round_trip_fare
  end

  def check_bus_student_discount_rate
    rate_number = BusPlan.new(
      basic_single_fare:      @bus_single_fare,
      student_discount_rate:  @bus_student_discount_rate,
      choose_coupon_discount: @choose_coupon_discount
    )
    rate_number.check_rate_number
  end

  def total_travel_fee
    total_train_fare + total_hotel_fee + total_airplane_fare + total_bus_fare
  end

  def total_train_fare_info
    "往復運賃  （学割、グリーン車料金含む）#{total_train_fare}円です。"
  end

  def total_hotel_fee_info
    "ホテル料金（各種オプション料金含む）  #{total_hotel_fee}円です。"
  end

  def total_airplane_fare_info
    "飛行機料金（学割、早割含む）          #{total_airplane_fare}円です。"
  end

  def total_bus_fare_info
    "バス料金  （学割、クーポン割引含む）   #{total_bus_fare}円です。"
  end

  def total_travel_fee_info
    "旅費の合計金額は#{total_travel_fee}円です。"
  end
end