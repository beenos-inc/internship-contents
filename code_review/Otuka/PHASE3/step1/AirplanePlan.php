<?php

class AirplanePlan
{
    const STUDENT_DISCOUNT_COEFFICIENT = 0.2;
    // PHASE.3 step.1 早期割の定数を定義する
    const EARLY_DISCOUNT_COEFFICIENT = 0.3;
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

    // PHASE.3 step.1 早期割を計算するメソッドを作成する
    public function useEarlyDiscount()
    {
        $this->price = floor($this->price * (1 - self::EARLY_DISCOUNT_COEFFICIENT));
    }

    public function getRoundTripPrice()
    {
        return $this->price * 2;
    }
}
