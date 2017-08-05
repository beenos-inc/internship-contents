<?php
require('TrainPlan.php');
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


/**
 * 旅費合計を求める
 **/