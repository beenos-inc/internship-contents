require_relative './option'

module Options
  class DiscountRateOption < Option
    def initialize(rate:)
      @rate = rate
    end

    def apply(value:)
      (value * ((100 - @rate).to_f / 100)).to_i
    end
  end
end