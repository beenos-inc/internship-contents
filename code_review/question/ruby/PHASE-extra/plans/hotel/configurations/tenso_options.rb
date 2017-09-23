require_relative './../../../options/additional_charge_option.rb'

module Plans
  module Hotel
    module Configurations
      class TensoOptions
        def configure
          options = []

          puts "Q. 朝食サービスは使用しますか?\n"
          [true, false].sample.tap do |res|
            puts "A. #{res.to_s}\n"
            options.push(Options::AdditionalChargeOption.new(charge_price: 500)) if res
          end
 
          puts "Q. 夕食サービスは使用しますか?\n"
          [true, false].sample.tap do |res|
            puts "A. #{res.to_s}\n"
            options.push(Options::AdditionalChargeOption.new(charge_price: 800)) if res
          end
          
          puts "Q. お部屋で喫煙されますか?\n"
          [true, false].sample.tap do |res|
            puts "A. #{res.to_s}\n"
            options.push(Options::AdditionalChargeOption.new(charge_price: 1_000)) if res
          end

          puts "Q. お部屋のグレードをお選びください\n"
          [:normal, :bronze, :silver, :gold].sample.tap do |res|
            puts "A. #{res}\n"
              
            options.push(Options::AdditionalChargeOption.new(
              charge_price: { normal: 0, bronze: 3_000, silver: 5_000, gold: 8_000 }[res]
            ))
          end

          options
        end
      end
    end
  end
end