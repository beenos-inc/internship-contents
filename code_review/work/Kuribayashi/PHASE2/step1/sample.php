<?php
/**
 * 交通費を求める
 **/


/**
 * 以下は交通費を求める際にクラスを使用したサンプルになります
 **/
$train_plan1 = new TrainPlan(12500);
echo $train_plan1->price . "\n";
$train_plan1->useStudentDiscount();
echo $train_plan1->price . "\n";

$train_plan2 = new TrainPlan(20000);
echo $train_plan2->price . "\n";
$train_plan2->useStudentDiscount();
echo $train_plan2->price . "\n";
$train_cost = $train_plan2->getRoundTripPrice();
echo $train_cost . "\n";
//$round_trip = $train_plan->getRoundTripPrice();





$hotel_plan2 = new HotelPlan(5000);
echo $hotel_plan2->price . "\n";
$hotel_plan2->useSmokerRoom();
$hotel_plan2->eatBrakefast();
$hotel_plan2->selectHotelRank("gold");
$hotel_plan2->eatDinner();
$hotel_cost =$hotel_plan2->price;
echo $hotel_plan2->price . "\n";


$travel_plan = new TravelPrice($train_cost, $hotel_cost);
echo $travel_plan->getTotalPrice(). "\n";
//$round_trip = $train_plan->getRoundTripPrice();




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

class HotelPlan
{
    // 喫煙ルームオプション代
    const SMOKER_COST = 1000;
    // ホテルの部屋別ランク料金
    const HOTEL_ROOM_RANK_ADD_FEES = [
        'normal' => 0,
        'bronze' => 3000,
        'silver' => 5000,
        'gold' => 8000
    ];
    // 食事料金
    const MEAL_ADD_FEES = [
        'breakfast' => 500,
        'dinner' => 800
    ];

    public $price = 0;


    public function __construct($price)
    {
        $this->price = $price;
    }

    public function useSmokerRoom()
    {
        $this->price = $this->price + self::SMOKER_COST;
    }

    public function eatBrakefast()
    {
        $this->price = $this->price + self::MEAL_ADD_FEES['breakfast'];
    }
    public function selectHotelRank($rank)
    {
      $this->price = $this->price + self::HOTEL_ROOM_RANK_ADD_FEES[$rank];
        echo self::HOTEL_ROOM_RANK_ADD_FEES[$rank] . "\n";
    }
    public function eatDinner()
    {
        $this->price = $this->price + self::MEAL_ADD_FEES['dinner'];
    }

/*
        $this->price = $this->price + self::HOTEL_ROOM_RANK_ADD_FEES = [
            'normal' => 0,
            'bronze' => 3000,
            'silver' => 5000,
            'gold' => 8000
        ];
        */


}


class TravelPrice
{
    private $total_price = 0;
    private $prices = [];

    public function __construct($round_trip_price, $hotel_price)
    {
      $this->prices[] = $round_trip_price;
      $this->prices[] = $hotel_price;

        // PHASE.2 step.1 配列"$prices"に引数の値ををそれぞれ格納する
    }

    public function getTotalPrice()
    {
      $this->total_price = array_sum($this->prices);
     // PHASE.2 step.1 配列の合計金額を求める処理を完成させる
        return $this->total_price;
    }
}
