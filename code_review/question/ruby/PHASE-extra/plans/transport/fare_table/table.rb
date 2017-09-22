module Plans
  module Transport
    module FareTable
      class Table
        def one_way_fare(destination:)
          resource[destination]
        end

        private

        def resource
          raise NotImplementedError, "未実装です"
        end
      end
    end
  end
end