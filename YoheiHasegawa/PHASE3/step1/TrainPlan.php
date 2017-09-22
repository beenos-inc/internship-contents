<?php

class TrainPlan
{
    // PHASE.3 step.1 グリーン車代の定数を定義する
    const GREEN_TRAIN_ADD_PRICE = 5000;
    private $price = 0;
    private $student_discount_coefficient = 0.2;

    public function __construct($price)
    {
        $this->price = $price;
    }

    public function useStudentDiscount()
    {
        $total_price = floor($this->price * (1 - self::STUDENT_DISCOUNT_COEFFICIENT));
        return $total_price;
    }

    // PHASE.3 step.1 グリーン車を利用するメソッドを追加する

    public function getRoundTripPrice()
    {
        return $this->price * 2;
    }

    public function setStudentDiscountPercent($student_discount)
    {
        if ($student_discount <= 0 ||
            $student_discount >= 100) {
              echo "学割の値は0より大きく100未満の値を入れて下さい\n";
              exit;
            }

        $this->student_discount_coefficient = $student_discount / 100;
    }
}
