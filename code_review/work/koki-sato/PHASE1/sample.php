<?php

/* PHASE.1 step.1 */
/**
 * 交通費を求める
 **/
// 片道電車運賃
const ONE_WAY_TRAIN_FREE = 12500;   //PHASE.1 step.1 交通費の変数名を設定する
//// 学割係数
const SCHOOL_DISCOUNT_RATE = 0.2;  //PHASE.1 step.1 学割の変数名を設定する

// 学割電車運賃を計算
$school_discounted_one_way_train_free = floor(ONE_WAY_TRAIN_FREE * (1 - SCHOOL_DISCOUNT_RATE));  //PHASE.1 step.1 学割のきいた片道代の変数名を設定する
$school_discounted_rounnd_tip_train_free = $school_discounted_one_way_train_free * 2;  //PHASE.1 step.1 往復代を求める処理を記述し、往復台の変数名を設定する

echo "交通費： " . $school_discounted_rounnd_tip_train_free;
echo "\n";

/*
/**
 * ホテル代を求める
 **/
// ホテル部屋代
const ROOM_FEE = 5000;
// 朝食代
const BREAKFAST_FEE = 500;
// 夕食代
const DINNER_FEE = 800;

// ホテル代を計算
$hotel_fee = ROOM_FEE + BREAKFAST_FEE + DINNER_FEE;

echo "ホテル代： " . $hotel_fee . "円";
echo "\n";

/**
 * 旅費合計を求める
 **/
$travel_expenses = $school_discounted_rounnd_tip_train_free + $hotel_fee;
echo "旅費合計： " . $travel_expenses . "円";
