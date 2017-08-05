<?php
/**
 * 交通費を求める
 **/
require("TrainPlan.php");
require("HotelPlan.php");
require("TravelPrice.php");
/**
 * 以下は交通費を求める際にクラスを使用したサンプルになります
 **/
$train_plan1 = new TrainPlan(12500);
echo $train_plan1->price . "\n";
$train_plan1->useStudentDiscount();
echo $train_plan1->price . "\n";

$train_plan2 = new TrainPlan(20000);
echo $train_plan2->price . "\n";
$train_plan2->useStudentDiscount();
echo $train_plan2->price . "\n";
$train_cost = $train_plan2->getRoundTripPrice();
echo $train_cost . "\n";
//$round_trip = $train_plan->getRoundTripPrice();





$hotel_plan2 = new HotelPlan(5000);
echo $hotel_plan2->price . "\n";
$hotel_plan2->useSmokerRoom();
$hotel_plan2->eatBrakefast();
$hotel_plan2->selectHotelRank("gold");
$hotel_plan2->eatDinner();
$hotel_cost =$hotel_plan2->price;
echo $hotel_plan2->price . "\n";


$travel_plan = new TravelPrice($train_cost, $hotel_cost);
echo $travel_plan->getTotalPrice(). "\n";
//$round_trip = $train_plan->getRoundTripPrice();
