require "./TravelPlan"

travel_plan = TravelPlan.new(
  basic_single_fare:   12_500,
  basic_hotel_fee:     5_000,
  choose_smoking_room: "yes",
  choose_rank_of_room: "gold",
  choose_breakfast:    "yes",
  choose_dinner:       "yes"
)

puts travel_plan.total_train_fare_info
puts travel_plan.total_hotel_fee_info
puts travel_plan.total_travel_fee_info