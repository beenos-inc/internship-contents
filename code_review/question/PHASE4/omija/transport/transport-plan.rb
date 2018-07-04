require "date"

class TransportPlan
  def initialize(price, student_discount_rate)
    @price = price
    @student_discount_rate = student_discount_rate
  end

  # 予約日設定用メソッド
  def set_use_date(year, month, day)
    if Date.valid_date?(year, month, day)
        reservation_day = Date.new(year, month, day)
        reserved_result_msg = "#{reservation_day.strftime("%Y年%m月%d日")}に予約日を設定しました"
        days_after_today = (reservation_day - Date.today).to_i
      if days_after_today > 0
        puts reserved_result_msg += "\n#{days_after_today}日前の予約です"
      elsif days_after_today == 0
        puts reserved_result_msg += "\n当日の予約です"
      else
        reservation_day = Date.today        
        puts "日付の設定が間違っています"
      end
    else
      reservation_day = Date.today        
      puts = "日付の設定が間違っています"
    end
    days_after_today
  end  

  # 学生割引計算用メソッド
  def use_student_discount
    if @student_discount_rate > 100 || @student_discount_rate < 0
      puts "学割の値は0より大きく100未満の値を入れてください"
      exit(0)
    end
     @price = (@price / @student_discount_rate).to_i
  end
  
  # 戻り値用メソッド
  def get_price
    @price
  end
end