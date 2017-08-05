<?php
/**
 * 交通費を求める
 **/
$train_plan = new TrainPlan(12500);
$train_price = $train_plan->useStudentDiscount();
echo "TransportExpenses" . $train_price . "yen";
echo "\n";
$round_trip = $train_plan->getRoundTripPrice($train_price);
echo "TransportExpenses" . $round_trip . "yen";
echo "\n";


//交通費計算メソッド
class TrainPlan
{
    const STUDENT_DISCOUNT_COEFFICIENT = 0.2;
    private $price = 0;


    public function __construct($price)
    {
        $this->price = $price;
    }

    public function useStudentDiscount()
    {
        // PHASE.2 step.1 学割料金を求めるメソッドを完成させる
        $train_price = floor($this->price * (1 - self::STUDENT_DISCOUNT_COEFFICIENT));
        return $train_price;
    }

    // PHASE.2 step.1 往復代を求めるメソッドを追加する
    public function getRoundTripPrice($train_price)
    {
        $round_trip = $train_price *2;
        return $round_trip;
    }
    

}
