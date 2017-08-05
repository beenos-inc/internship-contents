<?php

/* PHASE.1 step.1 */
/**
 * 交通費を求める
 **/
// 片道電車運賃
$one_way_train_yen = 12500;   //PHASE.1 step.1 交通費の変数名を設定する
//// 学割係数
$student_discount_rate = 0.2;  //PHASE.1 step.1 学割の変数名を設定する

// 学割電車運賃を計算
$one_way_student_train_yen = $one_way_train_yen * (1 - $student_discount_rate);  //PHASE.1 step.1 学割のきいた片道代の変数名を設定する
$round_trip_student_train_yen = $one_way_student_train_yen * 2;  //PHASE.1 step.1 往復代を求める処理を記述し、往復台の変数名を設定する

echo "交通費： " . $round_trip_student_train_yen;
echo "\n";

/*
/**
 * ホテル代を求める
 **/

// ホテル部屋代
$room_yen = 5000;
// 朝食代
$breakfast_yen = 500;
// 夕食代
$dinner_yen = 800;

// ホテル代を計算
$hotel_yen = $room_yen + $breakfast_yen + $dinner_yen;

echo "ホテル代： " . $hotel_yen . "円";
echo "\n";

/**
 * 旅費合計を求める
 **/

$trip_yen = $round_trip_student_train_yen + $hotel_yen;
echo "旅費合計： " . $trip_yen . "円";