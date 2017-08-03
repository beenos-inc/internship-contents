<?php

/* PHASE.1 step.1 */
// 学割のきいた電車賃の往復代を求める
const AAA = 0.2;  //PHASE.1 step.1 学割の変数名を設定する
$bbb = 12500;   //PHASE.1 step.1 交通費の変数名を設定する

$ccc = $bbb * (1 - AAA);  //PHASE.1 step.1 学割のきいた片道代の変数名を設定する
$ddd = xxxxx;  //PHASE.1 step.1 往復代を求める処理を記述し、往復台の変数名を設定する

echo "交通費： " . $ddd;
echo "\n";

/*
// PHASE.1 step.2
// ホテル代を求める
$eee = 5000;  //PHASE.1 step.2 ベースとなるホテル代の変数名を設定する

const FFF = 500;  //PHASE.1 step.2 朝食代のみの変数名を設定する
const GGG = 800;  //PHASE.1 step.2 夕食のみの変数名を設定する
const HHH = FFF + GGG;  //PHASE.1 step.2 朝食と夕食を合わせた変数名を設定する

$iii = $eee + HHH;  //PHASE.1 step.2 オプションも含めたホテル代の変数名を設定する

echo "ホテル代： " . $iii;
echo "\n";


// 合計金額
$total_cost = $ddd + $iii;
echo "旅費合計： " . $total_cost;
*/