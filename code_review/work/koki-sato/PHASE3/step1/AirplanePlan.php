<?php

class AirplanePlan
{
    const STUDENT_DISCOUNT_COEFFICIENT = 0.2;
    // PHASE.3 step.1 早期割の定数を定義する
    const EARLY_RESERVATION_DISCOUNT_COEFFICIENT = 0.3;
    private $price = 0;


    public function __construct($price)
    {
        $this->price = $price;
    }

    public function useStudentDiscount()
    {
        $this->price = floor($this->price * (1 - self::STUDENT_DISCOUNT_COEFFICIENT));
    }

    // PHASE.3 step.1 早期割を計算するメソッドを作成する
    public function useEarlyReservationDiscount()
    {
        $this->price = floor($this->price * (1 - self::EARLY_RESERVATION_DISCOUNT_COEFFICIENT));
    }

    public function getRoundTripPrice()
    {
        return $this->price * 2;
    }
}
