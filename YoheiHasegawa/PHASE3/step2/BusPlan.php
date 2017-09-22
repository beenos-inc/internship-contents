<?php

class BusPlan
{
    // PHASE.3 step.1 クーポン用の定数を定義する
    const COUPON_DISCOUNT_COEFFICIENT = 0.1;
    private $student_discount_coefficient = 0.3;
    private $price = 0;


    public function __construct($price)
    {
        $this->price = $price;
    }

    public function useStudentDiscount()
    {
        $total_price = floor($this->price * (1 - $this->student_discount_coefficient));
        return $total_price;
    }

    // PHASE.3 step.1 クーポン用を利用するメソッドを追加する
    public function useCouponDiscount()
    {
        $this->price = floor($this->price * (1 - self::COUPON_DISCOUNT_COEFFICIENT));
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

        $this->student_discount_coefficient = $student_discount / 100;
    }
}
