<?php
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
    private $price = 0;

    public function __construct($price)
    {
        $this->price = $price;
    }

    public function useSmokerRoom()
    {
        $this->price += self::SMOKER_COST;
    }

    public function selectHotelRank($rank)
    {
        // ホテルのランク
        if (!array_key_exists($rank, self::HOTEL_ROOM_RANK_ADD_FEES)) {
            echo "正しいランクを選択して下さい\n";
            exit;
        }

        $this->price += self::HOTEL_ROOM_RANK_ADD_FEES[$rank];
    }

    public function eatBreakfast()
    {
        $this->price += self::MEAL_ADD_FEES['breakfast'];
    }

    public function eatDinner()
    {
        $this->price += self::MEAL_ADD_FEES['dinner'];
    }

    public function getTotalPrice()
    {
        return $this->price;
    }
}
