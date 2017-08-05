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

    private $price = 0;

    public function __construct($price)
    {
        $this->price = $price;
    }

    // PHASE.2 step.1 喫煙可能部屋を使うメソッドを追加する
    public function useSmokerCost()
    {
        $this->price += self::SMOKER_COST;
    }

    // PHASE.2 step.1 ホテルのランクを選択するメソッドを追加する
    public function selectHotelRoomRank($select_hotel_rank)
    {
        if (!array_key_exists($select_hotel_rank, self::HOTEL_ROOM_RANK_ADD_FEES)) {
            echo "正しいランクを選択して下さい\n";
            exit;
        }
        $this->price += self::HOTEL_ROOM_RANK_ADD_FEES[$select_hotel_rank];
    }

    // PHASE.2 step.1 朝食を食べるメソッドを追加する
    public function addBreakfastPrice()
    {
        $this->price += self::MEAL_ADD_FEES['breakfast'];
    }

    // PHASE.2 step.1 夕食を食べるメソッドを追加する
    public function addDinnerPrice()
    {
        $this->price += self::MEAL_ADD_FEES['dinner'];
    }

    public function getTotalPrice()
    {
        return $this->price;
    }
}