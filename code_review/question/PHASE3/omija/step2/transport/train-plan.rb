require_relative "transport-plan.rb"

class TrainPlan < TransportPlan
  def use_green_car
    @price += 5000
  end
end
