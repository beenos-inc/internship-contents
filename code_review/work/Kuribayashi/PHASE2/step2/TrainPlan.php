<?php
// PHASE.2 step.2 TrainPlanクラスを作成する
class TrainPlan
{
    const STUDENT_DISCOUNT_COEFFICIENT = 0.2;
    public $price = 0;


    function __construct($price)
    {
        $this->price = $price;
    }

    public function useStudentDiscount()
    {
        $this->price = $this->price * (1 - self::STUDENT_DISCOUNT_COEFFICIENT);
    }

    public function getRoundTripPrice()
    {
       return $this->price * 2;

    }
    // PHASE.2 step.1 往復代を求めるメソッドを追加する

}
