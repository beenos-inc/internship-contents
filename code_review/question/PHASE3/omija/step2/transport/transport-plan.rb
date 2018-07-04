class TransportPlan
  def initialize(price, student_discount_rate)
    @price = price
    @student_discount_rate = student_discount_rate
  end
  
  def use_student_discount
    if @student_discount_rate > 100 || @student_discount_rate < 0
      puts "学割の値は0より大きく100未満の値を入れてください"
      exit(0)
    end
<<<<<<< HEAD
    @price = (@price - (@price * (@student_discount_rate / 100.0))).to_i
=======
     @price = (@price / @student_discount_rate).to_i
>>>>>>> d01655304bc6937b9d84afc2718de2af76d5f8d9
  end
  
  def get_price
    @price
  end
end