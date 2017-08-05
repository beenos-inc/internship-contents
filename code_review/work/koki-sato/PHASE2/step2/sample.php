<?php

// PHASE.2 step.2 3つのクラスをrequireする
require_once 'TrainPlan.php';
require_once 'HotelPlan.php';
require_once 'TravelPrice.php';

/**
 * 交通費を求める
 **/
$train_plan = new TrainPlan(12500);
$train_plan->useStudentDiscount();
$round_trip = $train_plan->getRoundTripPrice();

echo "交通費： " . $round_trip . "円\n";

/**
 * ホテル代を求める
 **/
$hotel_plan = new HotelPlan(5000);
$hotel_plan->eatBreakfast();
$hotel_plan->eatDinner();
$hotel_plan->useSmokingRoom();
$hotel_plan->selectHotelRank('silver');
$hotel_price = $hotel_plan->getTotalPrice();

echo "ホテル代： " . $hotel_price . "円\n";

/**
 * 旅費合計を求める
 **/
$travel_price = new TravelPrice($round_trip, $hotel_price);
$total_price = $travel_price->getTotalPrice();
echo "旅費合計： " . $total_price . "円\n";
