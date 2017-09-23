module Plans
  class HotelPlan
    def initialize(price_table:, options:)
      @price_table = price_table
      @options     = options
    end

    def hotel_fee
      @price_table.room_price(room_type: :single).tap do |rp|
        break @options.reduce(rp) { |result, option| option.apply(value: result) }
      end
    end
  end
end