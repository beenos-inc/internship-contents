<?php
require('TrainPlan.php');
require('HotelPlan.php');
require('TravelPrice.php');
// PHASE.2 step.2 3つのクラスをrequireする

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
