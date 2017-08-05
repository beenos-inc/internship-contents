<?php
// PHASE.2 step.2 travelPriceクラスを作成する

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
