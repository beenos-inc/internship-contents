require_relative './../../../options/discount_rate_option.rb'

module Plans
  module Transport
    module Configurations
      class BusOptions
        def configure
          options = []

          puts "Q. 学割の値引率を決定してください\n"
          rate = [10, 50, 90].sample.tap { |res| puts "A. #{res}\n" }
          
          puts "Q. 学割を使用しますか?\n"
          puts "A. true\n"
          options.push(Options::DiscountRateOption.new(rate: rate))

          puts "Q. クーポンを使用しますか?\n"
          [true, false].sample.tap do |res|
            puts "A. #{res.to_s}\n"
            options.push(Options::DiscountRateOption.new(rate: 10)) if res
          end
          
          options
        end
      end
    end
  end
end