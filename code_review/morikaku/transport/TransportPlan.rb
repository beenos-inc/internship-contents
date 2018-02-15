class TransportPlan
  def discount_fare
    raise "実装されていません"
  end

  def additional_fare
    raise "実装されていません"
  end

  def single_fare
    (@basic_single_fare - discount_fare) + additional_fare
  end

  def round_trip_fare
    single_fare * 2
  end
end