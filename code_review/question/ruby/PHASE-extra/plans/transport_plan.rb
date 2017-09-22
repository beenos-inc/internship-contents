module Plans
  class TransportPlan
    def initialize(fare_table:, options:)
      @fare_table = fare_table
      @options    = options
    end

    def round_trip_fare(destination:)
      fare = @fare_table.one_way_fare(destination: destination).tap do |owf|
        break @options.reduce(owf) { |result, option| option.apply(value: result) }
      end

      fare * 2
    end
  end
end