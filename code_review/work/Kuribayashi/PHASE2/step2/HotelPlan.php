<?php
// PHASE.2 step.2 HotelPlanクラスを作成する
class HotelPlan
{
    // 喫煙ルームオプション代
    const SMOKER_COST = 1000;
    // ホテルの部屋別ランク料金
    const HOTEL_ROOM_RANK_ADD_FEES = [
        'normal' => 0,
        'bronze' => 3000,
        'silver' => 5000,
        'gold' => 8000
    ];
    // 食事料金
    const MEAL_ADD_FEES = [
        'breakfast' => 500,
        'dinner' => 800
    ];

    public $price = 0;


    public function __construct($price)
    {
        $this->price = $price;
    }

    public function useSmokerRoom()
    {
        $this->price = $this->price + self::SMOKER_COST;
    }

    public function eatBrakefast()
    {
        $this->price = $this->price + self::MEAL_ADD_FEES['breakfast'];
    }
    public function selectHotelRank($rank)
    {
      $this->price = $this->price + self::HOTEL_ROOM_RANK_ADD_FEES[$rank];
        echo self::HOTEL_ROOM_RANK_ADD_FEES[$rank] . "\n";
    }
    public function eatDinner()
    {
        $this->price = $this->price + self::MEAL_ADD_FEES['dinner'];
    }

/*
        $this->price = $this->price + self::HOTEL_ROOM_RANK_ADD_FEES = [
            'normal' => 0,
            'bronze' => 3000,
            'silver' => 5000,
            'gold' => 8000
        ];
        */


}
