<?php

class AirplanePlan
{
    const EARLY_RESERVATION_DISCOUNT_COEFFICIENT = 0.2;
    private $price = 0;
    private $student_discount = 0;


    public function __construct($price)
    {
        $this->price = $price;
    }

    public function setStudentDiscountPercent($student_discount)
    {
        if (is_int($student_discount) && $student_discount > 0 && $student_discount < 100) {
            $this->student_discount = $student_discount;
        } else {
            echo "学割の値は0より大きく100未満の値を入れて下さい\n";
            exit;
        }
    }

    public function useStudentDiscount()
    {
        $this->price = floor($this->price * (1 - $this->student_discount * 0.01));
    }

    public function useEarlyReservationDiscount()
    {
        $this->price = floor($this->price * (1 - self::EARLY_RESERVATION_DISCOUNT_COEFFICIENT));
    }

    public function getRoundTripPrice()
    {
        return $this->price * 2;
    }
}
