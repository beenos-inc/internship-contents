<?php
require_once('AirplanePlan.php');
require_once('BusPlan.php');
require_once('HotelPlan.php');
require_once('TrainPlan.php');
require_once('TravelPrice.php');

$train_plan = new TrainPlan(12500);
$train_plan->setStudentDiscountPercent(40);
$train_plan->useStudentDiscount();
$train_price = $train_plan->getRoundTripPrice();

$hotel_plan = new HotelPlan(5000);
$hotel_plan->useSmokerRoom();
$hotel_plan->selectHotelRank('normal');
$hotel_price = $hotel_plan->getTotalPrice();

$travel_plan = new TravelPrice($train_price, $hotel_price);
$total_price = $travel_plan->getTotalPrice();
echo "交通費 : " . $train_price . "円\n";
echo "宿泊費 : " . $hotel_price . "円\n";
echo "旅費合計 : " . $total_price . "円\n";