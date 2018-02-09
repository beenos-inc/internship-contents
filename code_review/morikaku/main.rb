require "./TravelPlan"

travel_plan = TravelPlan.new(
  train_single_fare:              12_500,
  train_student_discount_rate:    20,
  choose_green_car:               "yes",
  basic_hotel_fee:                5_000,
  choose_smoking_room:            "yes",
  choose_rank_of_room:            "gold",
  choose_breakfast:               "yes",
  choose_dinner:                  "yes",
  airplane_single_fare:           22_500,
  airplane_student_discount_rate: 20,
  choose_early_booking_discount:  "yes",
  bus_single_fare:                1_000,
  bus_student_discount_rate:      10,
  choose_coupon_discount:         "yes"
)

puts travel_plan.total_train_fare_info
puts travel_plan.total_hotel_fee_info
puts travel_plan.total_airplane_fare_info
puts travel_plan.total_bus_fare_info
puts travel_plan.total_travel_fee_info