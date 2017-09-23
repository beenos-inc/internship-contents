require_relative './option'

module Options
  class AdditionalChargeOption < Option
    def initialize(charge_price:)
      @charge_price = charge_price
    end

    def apply(value:)
      value + @charge_price
    end
  end
end