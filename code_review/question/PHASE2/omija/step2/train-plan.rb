class TrainPlan
  STUDENT_DISCOUNT_COEFFICIENT = 0.2
  def initialize(train_price)
      @round_trip_price = train_price
  end

  def use_student_discount
      @round_trip_price = (@round_trip_price * (1 - STUDENT_DISCOUNT_COEFFICIENT)).to_i # PHASE.2 step.1 学割料金を求めるメソッドを完成させる
  end

  def get_round_trip_price # PHASE.2 step.1 往復代を求めるメソッドを追加する
      @round_trip_price
  end
end
