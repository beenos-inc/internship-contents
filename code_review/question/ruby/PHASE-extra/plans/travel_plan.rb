Dir[File.dirname(__FILE__) + '/hotel/**/*.rb'].each { |file| require file }
require_relative './hotel_plan'
Dir[File.dirname(__FILE__) + '/transport/**/*.rb'].each { |file| require file }
require_relative './transport_plan'

module Plans
  class TravelPlan
    def initialize(transportation:)
      @transportation = transportation
    end

    def planning(destination:, hotel:)
      round_trip_fare = transport_plan.round_trip_fare(destination: destination)
      hotel_fee       = hotel_plan(hotel: hotel).hotel_fee

      puts "交通費：#{round_trip_fare}円"
      puts "宿泊費：#{hotel_fee}円"
      puts "旅費合計：#{round_trip_fare + hotel_fee}円"
    end

    private

    def transport_plan
      case @transportation
      when :airplane
        return TransportPlan.new(
          fare_table: Transport::FareTable::Table.new.extend(Transport::FareTable::AirplaneResource),
          options:    Transport::Configurations::AirplaneOptions.new.configure
        )
      when :bus
        return TransportPlan.new(
          fare_table: Transport::FareTable::Table.new.extend(Transport::FareTable::BusResource),
          options:    Transport::Configurations::BusOptions.new.configure
        )
      else
        return TransportPlan.new(
          fare_table: Transport::FareTable::Table.new.extend(Transport::FareTable::TrainResource),
          options:    Transport::Configurations::TrainOptions.new.configure
        )
      end
    end

    def hotel_plan(hotel:)
      case hotel
      when :tenso
        return HotelPlan.new(
          price_table: Hotel::PriceTable::Table.new.extend(Hotel::PriceTable::TensoResource),
          options:     Hotel::Configurations::TensoOptions.new.configure
        )
      else
        raise SystemError, 'tensoにしておきなさい'
      end
    end
  end
end