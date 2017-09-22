require_relative './plans/travel_plan'

puts "Q. 移動手段はどうされますか？"
transportation = [:airplane, :bus, :train].sample.tap do |res|
  puts "A. #{res.to_s}"
end

Plans::TravelPlan.new(transportation: transportation)
  .planning(destination: :tokyo, hotel: :tenso)

