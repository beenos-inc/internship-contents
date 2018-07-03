require_relative "transport-plan.rb"

class TrainPlan < TransportPlan
  # グリーン車使用時の金額計算用メソッド
  def use_green_car
    @price += 5000
  end

  # 早期予約割引計算用メソッド
  def get_early_bird_discount_rate(result_subtraction)
    discount_rate = result_subtraction * 0.5
    if discount_rate > 0
      if discount_rate > 20
        discount_rate = 20
      end
      puts "早期予約割引で#{discount_rate}%の割引を適用します"
      @price = @price - (@price * (discount_rate / 10)).to_i
    end
  end

end
