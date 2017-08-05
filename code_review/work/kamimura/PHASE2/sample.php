<?php
class TrainPlan
{
    const STUDENT_DISCOUNT_COEFFICIENT = 0.2;
    private $price = 0;


    function __construct($price)
    {
        $this->price = $price;
    }

    public function useStudentDiscount()
    {
        $this->price = floor($this->price * (1 - self::STUDENT_DISCOUNT_COEFFICIENT));
    }

    // PHASE.2 step.1 往復代を求めるメソッドを追加する
    public function getRoundTripPrice()
    {
        return $this->price * 2;
    }

}

$train_price = new TrainPlan(12500);
$train_price -> useStudentDiscount();

echo "交通費: " . $train_price -> getRoundTripPrice() . "円\n";
