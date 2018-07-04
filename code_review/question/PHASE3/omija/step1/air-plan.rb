class AirPlan
  def initialize(price)
    @price = price
  end

  def use_student_discount(student_discount_rate)
    if student_discount_rate > 100 || student_discount_rate < 0
      puts "学割の値は0より大きく100未満の値を入れてください"
      exit(0)
    end
<<<<<<< HEAD
    @price = (@price - (@price * (student_discount_rate / 100.0))).to_i
   end
=======
     @price = (@price / student_discount_rate).to_i
  end
>>>>>>> d01655304bc6937b9d84afc2718de2af76d5f8d9

  def get_air_price
    @price
  end
end
