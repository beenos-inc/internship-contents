module Plans
  module Hotel
    module PriceTable
      class Table
        def room_price(room_type:)
          resource[room_type]
        end

        private

        def resource
          raise NotImplementedError, "未実装です"
        end
      end
    end
  end
end