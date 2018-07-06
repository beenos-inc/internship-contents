# ホテル料金を算出するクラス
class HotelPlan
    def initialize(
      day_default_price,
      hotel_room_rank = :normal,
      is_smoking_room = false,
      has_breakfast = false,
      has_dinner = false
    )
      @day_default_price = day_default_price
      @hotel_room_rank = hotel_room_rank
      @is_smoking_room = is_smoking_room
      @has_breakfast = has_breakfast
      @has_dinner = has_dinner
    end
  
    # ホテルランクのコストを取得するメソッド
    def hotel_room_rank_fee
      price_list = { normal: 0, bronze: 3000, silver: 5000, gold: 8000 }
  
      unless price_list.include?(@hotel_room_rank)
        p "正しいランクを選択してください"
        exit(0)
      end
  
      price_list[@hotel_room_rank]
    end
  
    # 喫煙可能部屋を利用時のコストを取得するメソッド
    def smoking_room_fee
      1000
    end
  
    # 朝食利用時のコストを取得するメソッド
    def breakfast_fee
      500
    end
  
    # 夕食利用時のコストを取得するメソッド
    def dinner_fee
      800
    end
  
    # ホテル料金合計を算出するメソッド
    def hotel_price
      total_option_fee = 0
      total_option_fee += hotel_room_rank_fee
      total_option_fee += smoking_room_fee if @is_smoking_room
      total_option_fee += breakfast_fee if @has_breakfast
      total_option_fee += dinner_fee if @has_dinner
  
      @day_default_price + total_option_fee
    end
  end