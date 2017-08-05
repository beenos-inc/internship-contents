<?php
// PHASE.2 step.2 3つのクラスをrequireする
require_once('TrainPlan.php');
require_once('HotelPlan.php');
require_once('TravelPrice.php');
/**
 * 交通費を求める
 **/
$train_plan = new TrainPlan(12500);
$train_plan->useStudentDiscount();
$round_trip_price = $train_plan->getRoundTripPrice();
echo "交通費: " . $round_trip_price . "円";
echo "\n";

/**
 * ホテル代を求める
 **/
$hotel_plan = new HotelPlan(5000);
$hotel_plan->useSmokerCost();
$hotel_plan->selectHotelRoomRank('silver');
$hotel_plan->addBreakfastPrice();
$hotel_plan->addDinnerPrice();
$hotel_price = $hotel_plan->getTotalPrice();
echo "ホテル代: " . $hotel_price . "円";
echo "\n";

/**
 * 旅費合計を求める
 **/
 $travel_price = new TravelPrice($round_trip_price, $hotel_price);
$total_price = $travel_price->getTotalPrice();
echo "旅費合計: " . $total_price . "円";