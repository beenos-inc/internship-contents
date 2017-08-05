<?php

/* PHASE.1 step.1 */
/**
 * 交通費を求める
 **/
// 片道電車運賃
const transport_expenses = 12500;   //PHASE.1 step.1 交通費の変数名を設定する
// 学割係数
const student_discount_ratio = 0.2;  //PHASE.1 step.1 学割の変数名を設定する

// 学割電車運賃を計算
$one_way_fee = floor(transport_expenses * (1 - student_discount_ratio));  //PHASE.1 step.1 学割のきいた片道代の変数名を設定する
$round_trip_cost = floor($one_way_fee * 2);  //PHASE.1 step.1 往復代を求める処理を記述し、往復代の変数名を設定する

// 往復の運賃を表示
echo "交通費： " . $round_trip_cost;
echo "\n";
/*
/**
 * ホテル代を求める
 **/
/*
// ホテル部屋代
const EEE = 5000;
// 朝食代
const FFF = 500;
// 夕食代
const GGG = 800;

// ホテル代を計算
$hhh = xxxxx;

echo "ホテル代： " . $hhh . "円";
echo "\n";
*/

/**
 * 旅費合計を求める
 **/
/*
$iii = $ddd + $hhh;
echo "旅費合計： " . $iii . "円";
*/