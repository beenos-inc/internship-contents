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

$hotel_plan = new HotelPlan();
//喫煙部屋を使用
$hotel_plan->useSmokerRoom();
//silverランクの部屋を使用
$hotel_plan->selectHotelRank();
//朝食を食べる
$hotel_plan->hasBreakfast();
//夕食を食べる
$hotel_plan->hasDinner();
//ホテル料金
$hotel_price = $hotel_plan->getTotalPrice();

echo "ホテル代： " . $hotel_price . "円";
echo "\n";


/**
 * 旅費合計を求める
 **/
 $total_plan = new TravelPrice($round_trip,$hotel_price);
 $total_price = $total_plan->getTotalPrice();
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
    private $has_breakfast = true;
    // 夕食とるorとらない
    private $has_dinner = true;
    // 喫煙or禁煙
    private $is_smoker = true;
    // ホテルの部屋ランク
    private $select_hotel_rank = 'silver';


    // ホテル代初期値設定

    public function __construct()
    {
      $this->hotel_price = self::HOTEL_ROOM_PRICE;
    }

    // PHASE.2 step.1 喫煙可能部屋を使うメソッドを追加する
    public function useSmokerRoom()
    {
      // 喫煙ルームオプション代加算
      if ($this->is_smoker === true) {
          $this->hotel_price += self::SMOKER_COST;
      }
    }

    // PHASE.2 step.1 ホテルのランクを選択するメソッドを追加する
    public function selectHotelRank()
    {
      // ホテルランク代加算
      if (!array_key_exists($this->select_hotel_rank, self::HOTEL_ROOM_RANK_ADD_FEES)) {
          echo "正しいランクを選択して下さい\n";
          exit;
      }
          $this->hotel_price += self::HOTEL_ROOM_RANK_ADD_FEES[$this->select_hotel_rank] ;
    }

    // PHASE.2 step.1 朝食を食べるメソッドを追加する
    public function hasBreakfast()
    {
    // 朝食代加算
      if ($this->has_breakfast === true) {
          $this->hotel_price += self::MEAL_ADD_FEES['breakfast'];
      }
    }

    // PHASE.2 step.1 夕食を食べるメソッドを追加する
    public function hasDinner()
    {
    // 朝食代加算
      if ($this->has_dinner === true) {
          $this->hotel_price += self::MEAL_ADD_FEES['dinner'];
      }
    }

    public function getTotalPrice()
    {
        return $this->hotel_price;
    }
}

class TravelPrice
{
    private $total_price = 0;
    private $prices = [];

    public function __construct($round_trip_price, $hotel_price)
    {
        // PHASE.2 step.1 配列"$prices"に引数の値ををそれぞれ格納する
        $this->prices = [$round_trip_price, $hotel_price];
    }

    public function getTotalPrice()
    {
        // PHASE.2 step.1 配列の合計金額を求める処理を完成させる
       $this->total_price = $this->prices[0] + $this->prices[1];
        return $this->total_price;
    }
}
