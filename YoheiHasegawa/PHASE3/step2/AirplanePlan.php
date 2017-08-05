<?php

class AirplanePlan
{
    private $price = 0;
    private $student_discount_coefficient = 0.2;
    private $early_discount_coefficient = 0.3;

    public function __construct($price)
    {
        $this->price = $price;
    }

    public function useStudentDiscount()
    {
        $total_price = floor($this->price * (1 - self::STUDENT_DISCOUNT_COEFFICIENT));
        return $total_price;
    }

    // PHASE.3 step.1 早期割を計算するメソッドを作成する
    public function useEarlyDiscount()
    {
      $this->price += floor($this->price * (1 - self::EARLY_DISCOUNT_COEFFICIENT));
    }

    public function getRoundTripPrice()
    {
        return $this->price * 2;
    }

    public function setStudentDiscountPercent($student_discount)
    {
        if ($student_discount <= 0 ||
            $student_discount >= 100) {
              echo "学割の値は0より大きく100未満の値を入れて下さい\n";
              exit;
            }

        $this->student_discount_coefficient = $student_discount;
    }
}
