<?php

$train_plan = new TrainPlan(12500);
$train_plan->applyStudentDiscount();
$round_trip = $train_plan->getRoundTripPrice();
echo "交通費： " . $round_trip . "円";
echo "\n";


$hotel_plan = new HotelPlan();
echo "ホテル代： " . $hotel_price . "円";
echo "\n";


$travel_price = new TravelPrice($round_trip,$hotel_price);
$total_price = getTotalPrice();
echo "旅費合計： " . $total_price . "円";



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

class HotelPlan
{
    public $smoker_cost = 1000;

    public $hotel_room_rank_add_fees = [
        'normal' => 0,
        'bronze' => 3000,
        'silver' => 5000,
        'gold' => 8000
    ];
    
    public $meal_add_fees = [
        'breakfast' => 500,
        'dinner' => 800
    ];

    private $price = 0;

    public $has_breakfast = true;

    public $has_dinner = false;

    public $is_smoker = false;

    public $select_hotel_rank = 'gold';

    public function __construct($price)
    {
        $this->price = $price;
    }
    // PHASE.2 step.1 喫煙可能部屋を使うメソッドを追加する
    public function smokerRoom(){
        if ($is_smoker === true) {
            return $hotel_price += SMOKER_COST;
        }
    }
    // PHASE.2 step.1 ホテルのランクを選択するメソッドを追加する
    public function hotelRank(){
        if (!array_key_exists($select_hotel_rank, HOTEL_ROOM_RANK_ADD_FEES)) {
    echo "正しいランクを選択して下さい\n";
        exit;
        }
    }
    // PHASE.2 step.1 朝食を食べるメソッドを追加する
    public function breakfast(){
        if ($has_breakfast === true) {
            $hotel_price += MEAL_ADD_FEES['breakfast'];
        }
    }
    // PHASE.2 step.1 夕食を食べるメソッドを追加する
    public function dinner(){
        if ($has_dinner === true) {
            $hotel_price += MEAL_ADD_FEES['dinner'];
        }
    }
}

class TravelPrice
{
    private $total_price = 0;
    private $prices = [];

    public function __construct($round_trip_price, $hotel_price)
    {
        // PHASE.2 step.1 配列"$prices"に引数の値をそれぞれ格納する
        $this->prices = $round_trip_price;
        $this->prices = $hotel_price;
    }

    public function getTotalPrice()
    {
        // PHASE.2 step.1 配列の合計金額を求める処理を完成させる
        return $this->total_price;
    }
}
/*public $hotel_price += HOTEL_ROOM_RANK_ADD_FEES[$select_hotel_rank];*/