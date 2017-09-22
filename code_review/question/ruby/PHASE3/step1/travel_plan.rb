class TravelPlan
  def initialize(round_trip_fare:, hotel_fee:)
    @costs = [
      round_trip_fare,
      hotel_fee
    ]
  end

  def total_costs
    @costs.inject(:+)
  end
end