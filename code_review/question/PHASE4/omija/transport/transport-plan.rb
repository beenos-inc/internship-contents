require "date"

class TransportPlan
  def initialize(price, student_discount_rate)
    @price = price
    @student_discount_rate = student_discount_rate
  end

  # 予約日設定用メソッド
  def set_use_date(year, month, day)
    if Date.valid_date?(year, month, day)
        date = Date.new(year, month, day)
        msg = "#{date.strftime("%Y年%m月%d日")}に予約日を設定しました"
        result_subtraction = (date - Date.today).to_i
      if result_subtraction > 0
        puts msg += "\n#{result_subtraction}日前の予約です"
      elsif result_subtraction == 0
        puts msg += "\n当日の予約です"
      else
        date = Date.today        
        puts msg = "日付の設定が間違っています"
      end
    else
      date = Date.today        
      puts msg = "日付の設定が間違っています"
    end
    result_subtraction
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