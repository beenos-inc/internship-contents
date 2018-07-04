require_relative "transport-plan.rb"

class TrainPlan < TransportPlan
  # グリーン車使用時の金額計算用メソッド
  def use_green_car
    @price += 5000
  end

  # 早期予約割引計算用メソッド
  def get_early_bird_discount_rate(days_after_today)
    reserved_discount_rate = days_after_today * 0.5
    reserved_discount_rate = 20 if reserved_discount_rate > 20
    if reserved_discount_rate > 0
      puts "早期予約割引で#{reserved_discount_rate}%の割引を適用します"
      @price = (@price - (@price * (reserved_discount_rate / 100.0))).to_i
    end
  end

end
