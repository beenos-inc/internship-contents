<?php

/* PHASE.1 step.1 */
/**
 * 交通費を求める
 **/
// 片道電車運賃
const single_fare = 12500;   //PHASE.1 step.1 交通費の変数名を設定する
//// 学割係数
const discount_rate = 0.2;  //PHASE.1 step.1 学割の変数名を設定する

// 学割電車運賃を計算
$single_fare_at_discount = floor(single_fare * (1 - discount_rate));  //PHASE.1 step.1 学割のきいた片道代の変数名を設定する
$round_trip_fare_at_discount = $single_fare_at_discount * 2;  //PHASE.1 step.1 往復代を求める処理を記述し、往復台の変数名を設定する

echo "交通費： " . $round_trip_fare_at_discount. "円";
echo "\n";

/*
/**
 * ホテル代を求める
 **/
// ホテル部屋代
const hotel_fee = 5000;
// 朝食代
const breakfast_fee = 500;
// 夕食代
const dinnar_fee = 800;

// ホテル代を計算
$hotel_fee_include_meal  = hotel_fee + breakfast_fee + dinnar_fee;

echo "ホテル代： " . $hotel_fee_include_meal . "円";
echo "\n";

/**
 * 旅費合計を求める
 **/
$total_travel_fee = $round_trip_fare_at_discount + $hotel_fee_include_meal;
echo "旅費合計： " . $total_travel_fee . "円";
