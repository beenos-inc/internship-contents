## PHASE.4 todo

### step.1 電車賃を求める際に早期割引を追加する

【やること】  
- TransportPlanクラス
  - 使用する日程を登録出来るようにする
    - `setUseDate()`をメソッドを作成
      - 引数に「年, 月, 日」を渡す
      - 引数の日付が間違っている場合
        - `日付の設定が間違っています`と出力する
        - 今日の日付を設定する
      - 引数の数値が正しい場合
        - `◯年◯月◯日に予約日を設定しました`と出力する
        - 当日以外の場合は`◯日前の予約です`と出力する
        - 当日予約の場合は`当日の予約です`と出力する
- TrainPlanクラス
  - 申し込んだ日付で割引額が変わる機能を追加
    - `getEarlyBirdDiscountRate($interval_day)`メソッドを作成
    - MAX 割引率 20%
    - 1日早く予約する毎に 0.5% 割引（前日予約が0.5%割引）
    - 割引率が0より大きければ`早期予約割引で◯%の割引を適用します`と表示する


日付を求めるのはDateTimeクラスを使用して下さい  
参考：http://php.net/manual/ja/class.datetime.php


【期待する結果】  
- 交通賃
  - 電車を使用
  - 基本料金12500円
  - 学割の値引き率を20%に変更して学割を使用
  - 2017/8/5から20日後（2017/8/25）に旅行に申し込む
- ホテル代
  - ビジネスホテルを使用
  - 基本料金10000円
  - 喫煙の部屋
  - silverランクの部屋を使用
  - 朝食あり
  - 夕食あり

`php main.php`を実行し、
```
2017年08月25日に予約日を設定しました
20日前の予約です
早期予約割引で10%の割引を適用します
交通費： 18000円
ホテル代： 17300円
旅費合計： 35300円
```


と出力される


tips:
以下のようなメッセージが表示された場合
```
Warning: date(): It is not safe to rely on the system's timezone settings. You are *required* to use the date.timezone setting or the date_default_timezone_set() function.
```
php.iniのtime.zoneが設定されていないのが原因なので、
php.iniにtime.zoneの設定を行う。

```
php --ini

Configuration File (php.ini) Path: /usr/local/etc/php/5.6
Loaded Configuration File:         /usr/local/etc/php/5.6/php.ini
Scan for additional .ini files in: /usr/local/etc/php/5.6/conf.d
Additional .ini files parsed:      (none)
```

Loaded Configuration Fileで表示されたファイルを編集する
`vim /usr/local/etc/php/5.6/php.ini`


`date.timezone = `に値を設定しコメントアウトを外す

```
[Date]
; Defines the default timezone used by the date functions
; http://php.net/date.timezone
date.timezone = "Asia/Tokyo"

; http://php.net/date.default-latitude
;date.default_latitude = 31.7667
```