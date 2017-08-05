<?php

// PHASE.3 step.1 5つのクラスをrequireする
require_once("AirplanePlan.php");
require_once("BusPlan.php");
require_once("HotelPlan.php");
require_once("TrainPlan.php");
require_once("TravelPrice.php");
/**
 * 交通費を求める
 **/
$airplane_plan = new AirplanePlan(30000);
$airplane_price = $airplane_plan->useEarlyStageDiscount();
$airplane_price = $airplane_plan->getRoundTripPrice();

/**
 * ホテル代を求める
 **/
$hotel_plan = new HotelPlan(8000);
$hotel_plan->selectHotelRank("gold");
$hotel_plan->eatBreakfast();
$hotel_plan->eatDinner();
$hotel_price = $hotel_plan->getTotalPrice();

/**
 * 旅費合計を求める
 **/
 $travel_price = new TravelPrice($airplane_price, $hotel_price);
 $total_price = $travel_price->getTotalPrice();
 echo "交通費 : " . $airplane_price . "円\n";
 echo "宿泊費 : " . $hotel_price . "円\n";
 echo "旅費合計 :" . $total_price . "円";