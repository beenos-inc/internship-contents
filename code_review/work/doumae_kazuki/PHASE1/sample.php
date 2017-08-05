<?php
/* PHASE.1 step.1 */
/**
 * 交通費を求める
 **/
// 片道電車運賃
const one_way_train_fee = 12500;   //PHASE.1 step.1 交通費の変数名を設定する
//// 学割係数
const school_discount_rate = 0.2;  //PHASE.1 step.1 学割の変数名を設定する

// 学割電車運賃を計算
$train_fare = floor(one_way_train_fee * (1 - school_discount_rate));  //PHASE.1 step.1 学割のきいた片道代の変数名を設定する
$reciprocation = $train_fare * 2;  //PHASE.1 step.1 往復代を求める処理を記述し、往復台の変数名を設定する

echo "Fare:" . $reciprocation; 
echo "\n";

/**
 * ホテル代を求める
 **/
// ホテル部屋代
const room_rent = 5000;
// 朝食代
const breakfast_fee = 500;
// 夕食代
const dinner_fee = 800;

// ホテル代を計算
$hotel_fee = room_rent + breakfast_fee + dinner_fee;

echo "HotelFee:" . $hotel_fee . "yen";
echo "\n";

/**
 * 旅費合計を求める
 **/
$travel_expenses = $reciprocation + $hotel_fee;
echo "TravelExpenses:" . $travel_expenses . "yen";