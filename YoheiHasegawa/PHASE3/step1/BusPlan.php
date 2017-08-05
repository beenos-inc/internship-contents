<?php

class BusPlan
{
    const STUDENT_DISCOUNT_COEFFICIENT = 0.2;
    // PHASE.3 step.1 クーポン用の定数を定義する
    const COUPON_DISCOUNT_COEFFICIENT = 0.1;
    private $price = 0;


    public function __construct($price)
    {
        $this->price = $price;
    }

    public function useStudentDiscount()
    {
        $total_price = floor($this->price * (1 - self::STUDENT_DISCOUNT_COEFFICIENT));
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
}
