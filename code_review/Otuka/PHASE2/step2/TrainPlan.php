<?php
// PHASE.2 step.2 TrainPlanクラスを作成する

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
        // PHASE.2 step.1 学割料金を求めるメソッドを完成させる
        $this->price = floor($this->price * (1 - self::STUDENT_DISCOUNT_COEFFICIENT));
    }

    // PHASE.2 step.1 往復代を求めるメソッドを追加する
    public function getRoundTripPrice()
    {
        return $this->price * 2;
    }
}
