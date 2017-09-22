class HotelPlan
  HOTEL_ROOM_CHARGE_PER_DAY = 5_000
  # 食事サービス料金
  MEAL_SERVICE_CHARGE_LIST = {
    :breakfast => 500,
    :supper    => 800
  }
  # 喫煙ルーム使用料金
  SMOKING_ROOM_USAGE_CHARGE = 1_000
  # 部屋のグレード別料金
  ROOM_GRADE_ADDITIONAL_CHARGE_LIST = {
    :normal => 0,
    :bronze => 3_000,
    :silver => 5_000,
    :gold   => 8_000
  }

  def initialize(with_breakfast:, with_supper:, smoking_allowed:, room_grade:)
    @with_breakfast  = with_breakfast
    @with_supper     = with_supper
    @smoking_allowed = smoking_allowed
    @room_grade      = room_grade
  end

  def hotel_fee
    [
      HOTEL_ROOM_CHARGE_PER_DAY,
      meal_service_charge,
      smoking_room_usage_charge,
      room_grade_additional_charge
    ].inject(:+)
  end

  private

  def meal_service_charge
    [
      @with_breakfast ? MEAL_SERVICE_CHARGE_LIST[:breakfast] : 0,
      @with_supper    ? MEAL_SERVICE_CHARGE_LIST[:supper]    : 0
    ].inject(:+)
  end

  def smoking_room_usage_charge
    @smoking_allowed ? SMOKING_ROOM_USAGE_CHARGE : 0
  end

  def room_grade_additional_charge
    ROOM_GRADE_ADDITIONAL_CHARGE_LIST[@room_grade]
  end
end