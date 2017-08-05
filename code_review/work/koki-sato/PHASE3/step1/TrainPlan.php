<?php

class TrainPlan
{
    const STUDENT_DISCOUNT_COEFFICIENT = 0.2;
    // PHASE.3 step.1 グリーン車代の定数を定義する
    const GREEN_CAR_COST = 5000;
    private $price = 0;


    public function __construct($price)
    {
        $this->price = $price;
    }

    public function useStudentDiscount()
    {
        $this->price = floor($this->price * (1 - self::STUDENT_DISCOUNT_COEFFICIENT));
    }

    // PHASE.3 step.1 グリーン車を利用するメソッドを追加する
    public function useGreenCar()
    {
        $this->price = $this->price + self::GREEN_CAR_COST;
    }

    public function getRoundTripPrice()
    {
        return $this->price * 2;
    }
}
