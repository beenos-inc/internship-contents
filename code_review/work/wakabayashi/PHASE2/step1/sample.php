<?php

$train_plan = new TrainPlan(12500);
$train_plan->applyStudentDiscount();
$round_trip = $train_plan->getRoundTripPrice();

echo "交通費： " . $round_trip . "円";
echo "\n";



/*echo "ホテル代： " . $hotel_price . "円";
echo "\n";

echo "旅費合計： " . $total_price . "円";*/



class TrainPlan
{
    private $student_discount_coefficient = 0.2;
    private $price = 0;


    public function __construct($price){
        $this->price = $price;
    }

    public function applyStudentDiscount(){
        // PHASE.2 step.1 学割料金を求めるメソッドを完成させる
        $this->price = $this->price * (1-$this->student_discount_coefficient);
    }

    // PHASE.2 step.1 往復代を求めるメソッドを追加する
    public function getRoundTripPrice(){
        return $this->price * 2;
    }

}


