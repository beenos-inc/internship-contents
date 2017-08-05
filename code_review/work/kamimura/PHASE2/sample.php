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
    public function useSmookingRoom()
    {
        $this->price += self::SMOKER_COST;
    }
    // PHASE.2 step.1 ホテルのランクを選択するメソッドを追加する
    public function selectRank($rank)
    {
        $this->price += self::HOTEL_ROOM_RANK_ADD_FEES[$rank];
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

$train_price = new TrainPlan(12500);
$train_price -> useStudentDiscount();

$hotel_price = new HotelPlan(5000);
$hotel_price -> useSmookingRoom();
$hotel_price -> selectRank('silver');
$hotel_price -> eatBreakfast();
$hotel_price -> eatDinner();

echo "交通費: " . $train_price -> getRoundTripPrice() . "円\n";
echo "ホテル代: " . $hotel_price -> getTotalPrice() . "円\n";
