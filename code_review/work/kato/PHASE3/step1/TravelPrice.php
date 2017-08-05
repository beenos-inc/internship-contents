<?php
class TravelPrice
{
    private $total_price = 0;
    private $prices = [];

    public function __construct($round_trip_price, $hotel_price)
    {
        $this->prices[] = $round_trip_price;
        $this->prices[] = $hotel_price;
    }

    public function getTotalPrice()
    {
        $this->total_price = array_sum($this->prices);
        return $this->total_price;
    }
}