<?php

/* PHASE.1 step.1 */
/**
 * 交通費を求める
 **/
// 片道電車運賃
const ONE_WAY_TRAIN_FARE = 12500;   //PHASE.1 step.1 交通費の変数名を設定する
//// 学割係数
const STUDENT_DISCOUNT_RATE = 0.2;  //PHASE.1 step.1 学割の変数名を設定する

// 学割電車運賃を計算
$student_single_fare = floor(ONE_WAY_TRAIN_FARE * (1 - STUDENT_DISCOUNT_RATE));  //PHASE.1 step.1 学割のきいた片道代の変数名を設定する
$student_round_trip = $student_single_fare*2;  //PHASE.1 step.1 往復代を求める処理を記述し、往復台の変数名を設定する

echo "交通費： " . $student_round_trip . "円";
echo "\n";

/*
/**
 * ホテル代を求める
 **/
// ホテル部屋代
const HOTEL_ROOM_RENT = 5000;
// 朝食代
const BREAKFAST_PRICE = 500;
// 夕食代
const DINNER_PRICE = 800;

// ホテル代を計算
$sum_hotel_fee = HOTEL_ROOM_RENT+BREAKFAST_PRICE+DINNER_PRICE;

echo "ホテル代： " . $sum_hotel_fee . "円";
echo "\n";

/**
 * 旅費合計を求める
 **/
/*
$iii = $ddd + $hhh;
echo "旅費合計： " . $iii . "円";
*/
