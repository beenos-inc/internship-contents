class TrainPlan
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
=======
    @price = (@price / student_discount_rate).to_i
>>>>>>> d01655304bc6937b9d84afc2718de2af76d5f8d9
  end

  def use_green_car
    @price += 5000
  end

  def get_train_price
    @price
  end
end
