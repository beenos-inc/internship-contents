<?php

class TrainPlan
{
    const GREEN_CAR_COST = 5000;
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

    public function useGreenCar()
    {
        $this->price += self::GREEN_CAR_COST;
    }

    public function getRoundTripPrice()
    {
        return $this->price * 2;
    }
}
