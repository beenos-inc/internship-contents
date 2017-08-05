<?php

/**
 * 交通費を求める
 **/

$train_plan = new TrainPlan(12500);
$train_plan->useStudentDiscount();
$round_trip_price = $train_plan->getRoundTripPrice();

echo "交通費： " . $round_trip_price . "円";
echo "\n";

/**
 * ホテル代を求める
 **/

$hotel_plan = new HotelPlan(5000);
$hotel_plan->useSmokingRoom();
$hotel_plan->selectHotelRank('silver');
$hotel_plan->eatBreakfast();
$hotel_plan->eatDinner();
$hotel_price = $hotel_plan->getTotalPrice();

echo "ホテル代： " . $hotel_price . "円";
echo "\n";


/**
 * 旅費合計を求める
 **/

$travel_plan = new TravelPrice($round_trip_price, $hotel_price);
$travel_price = $travel_plan->getTotalPrice();
echo "旅費合計： " . $travel_price . "円";


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

    private $price = 0;


    public function __construct($price)
    {
        $this->price = $price;
    }

    // PHASE.2 step.1 喫煙可能部屋を使うメソッドを追加する
    public function useSmokingRoom()
    {
        $this->price += self::SMOKER_COST;
    }

    // PHASE.2 step.1 ホテルのランクを選択するメソッドを追加する
    public function selectHotelRank($select_hotel_lank)
    {
        if (!array_key_exists($select_hotel_lank, self::HOTEL_ROOM_RANK_ADD_FEES)) {
            echo "正しいランクを選択して下さい\n";
            exit;
        }

        $this->price += self::HOTEL_ROOM_RANK_ADD_FEES[$select_hotel_lank];
    }

    // PHASE.2 step.1 朝食を食べるメソッドを追加する
    public function eatBreakfast()
    {
        $this->price += self::MEAL_ADD_FEES['breakfast'];
    }
    // PHASE.2 step.1 夕食を食べるメソッドを追加する
    public function eatDinner()
    {
        $this->price += self::MEAL_ADD_FEES['dinner'];
    }

    public function getTotalPrice()
    {
        return $this->price;
    }
}

class TravelPrice
{
    private $total_price = 0;
    private $prices = [];

    public function __construct($round_trip_price, $hotel_price)
    {
        // PHASE.2 step.1 配列"$prices"に引数の値ををそれぞれ格納する
        array_push($this->prices, $round_trip_price, $hotel_price);
    }

    public function getTotalPrice()
    {
        // PHASE.2 step.1 配列の合計金額を求める処理を完成させる
        $this->total_price += array_sum($this->prices);

        return $this->total_price;
    }
}
