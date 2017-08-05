<?php

// PHASE.3 step.1 5つのクラスをrequireする
require_once 'AirplanePlan.php';
require_once 'BusPlan.php';
require_once 'TrainPlan.php';
require_once 'HotelPlan.php';
require_once 'TravelPrice.php';

/**
 * 交通費を求める
 **/
$train_plan = new TrainPlan(12500);
$train_plan->setStudentDiscountPercent(40);
$train_plan->useStudentDiscount();
$round_trip = $train_plan->getRoundTripPrice();

echo "交通費： " . $round_trip . "円\n";

/**
 * ホテル代を求める
 **/
$hotel_plan = new HotelPlan(5000);
$hotel_plan->useSmokerRoom();
$hotel_plan->selectHotelRank('normal');
$hotel_price = $hotel_plan->getTotalPrice();

echo "ホテル代： " . $hotel_price . "円\n";

/**
 * 旅費合計を求める
 **/
$travel_price = new TravelPrice($round_trip, $hotel_price);
$total_price = $travel_price->getTotalPrice();

echo "旅費合計： " . $total_price . "円\n";
