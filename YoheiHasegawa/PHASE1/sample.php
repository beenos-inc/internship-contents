<?php

/* PHASE.1 step.1 */
/**
 * 交通費を求める
 **/
// 片道電車運賃
const ONEWAY_TRAINFARE = 12500;   //PHASE.1 step.1 交通費の変数名を設定する
//// 学割係数
const STUDENT_DISCOUNT_PER = 0.2;  //PHASE.1 step.1 学割の変数名を設定する

// 学割電車運賃を計算
$oneway_student_price = floor(ONEWAY_TRAINFARE * (1 - STUDENT_DISCOUNT_PER));  //PHASE.1 step.1 学割のきいた片道代の変数名を設定する
$round_trip_student_price = $oneway_student_price * 2;  //PHASE.1 step.1 往復代を求める処理を記述し、往復台の変数名を設定する

echo "交通費： " . $round_trip_student_price;
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