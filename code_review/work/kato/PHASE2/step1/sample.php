<?php
/**
 * 交通費を求める
 **/
$train_plan = new TrainPlan(12500);
// 学割電車運賃を計算
$train_plan->useStudentDiscount();
// 学割往復交通費
$round_trip = $train_plan->getRoundTripPrice();

echo "交通費： " . $round_trip . "円";
echo "\n";


/**
 * ホテル代を求める
 **/
// ホテル部屋代
const HOTEL_ROOM_PRICE = 5000;
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

// 朝食とるorとらない
$has_breakfast = true;
// 夕食とるorとらない
$has_dinner = false;
// 喫煙or禁煙
$is_smoker = false;
// ホテルの部屋ランク
$select_hotel_rank = 'gold';


// ホテル代初期値設定
$hotel_price = HOTEL_ROOM_PRICE;

// 朝食代加算
if ($has_breakfast === true) {
    $hotel_price += MEAL_ADD_FEES['breakfast'];
}
// 夕食代加算
if ($has_dinner === true) {
    $hotel_price += MEAL_ADD_FEES['dinner'];
}
// 喫煙ルームオプション代加算
if ($is_smoker === true) {
    $hotel_price += SMOKER_COST;
}
// ホテルランク代加算
if (!array_key_exists($select_hotel_rank, HOTEL_ROOM_RANK_ADD_FEES)) {
    echo "正しいランクを選択して下さい\n";
    exit;
}
$hotel_price += HOTEL_ROOM_RANK_ADD_FEES[$select_hotel_rank];

echo "ホテル代： " . $hotel_price . "円";
echo "\n";


/**
 * 旅費合計を求める
 **/
$total_price = $round_trip + $hotel_price;
echo "旅費合計： " . $total_price . "円";


class TrainPlan
{
    const STUDENT_DISCOUNT_COEFFICIENT = 0.2;
    private $price = 0;
    private $student_discount_price = 0;
    private $round_trip = 0;


    function __construct($price)
    {
        $this->price = $price;
    }

    public function useStudentDiscount()
    {
        // PHASE.2 step.1 学割料金を求めるメソッドを完成させる
        // 学割電車運賃を計算
        $this->student_discount_price = floor($this->price * (1 - self::STUDENT_DISCOUNT_COEFFICIENT));
    }

    public function getRoundTripPrice()
    {
      // PHASE.2 step.1 往復代を求めるメソッドを追加する
      $this->round_trip = $this->student_discount_price * 2;
      return $this->round_trip;
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
    // 朝食とるorとらない
    private $has_breakfast = true;
    // 夕食とるorとらない
    private $has_dinner = false;
    // 喫煙or禁煙
    private $is_smoker = false;
    // ホテルの部屋ランク
    private $select_hotel_rank = 'gold';


    // ホテル代初期値設定
    $hotel_price = HOTEL_ROOM_PRICE;


    public function __construct($price)
    {
        $this->price = $price;
    }

    // PHASE.2 step.1 喫煙可能部屋を使うメソッドを追加する
    public function useSmokerRoom()
    {
      // 喫煙ルームオプション代加算
      if ($is_smoker === true) {
          $this->hotel_price += self::SMOKER_COST;
      }
    }

    // PHASE.2 step.1 ホテルのランクを選択するメソッドを追加する

    // PHASE.2 step.1 朝食を食べるメソッドを追加する
    public function hasBreakfast()
    {
    // 朝食代加算
      if ($has_breakfast === true) {
          $hotel_price += MEAL_ADD_FEES['breakfast'];
      }
    }

    // PHASE.2 step.1 夕食を食べるメソッドを追加する
    public function hasDinner()
    {
    // 朝食代加算
      if ($has_dinner === true) {
          $hotel_price += MEAL_ADD_FEES['dinner'];
      }
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
    }

    public function getTotalPrice()
    {
        // PHASE.2 step.1 配列の合計金額を求める処理を完成させる
        return $this->total_price;
    }
}
