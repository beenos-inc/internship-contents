# 割引料金を算出するクラス
class DiscountFee
  def initialize(default_price, selected_discount, student_discount_rate)
    @default_price = default_price
    @selected_discount = selected_discount
    @student_discount_rate = student_discount_rate
  end

  # 割引率が1~99の整数かどうか確認するメソッド
  def validate_discount_rate(discount_rate)
    return false unless discount_rate.is_a?(Integer)

    0 < discount_rate && discount_rate < 100
  end

  # 割引率が正しい値ではなかった時の処理
  def false_validate_discount_rate?
    puts "割引率は整数で0より大きく100未満の値を入れてください"
    exit(0)
  end

  # 割引料金を算出するメソッド
  def discount_fee
    discount_list = { 学割: @student_discount_rate, クーポン: 10, 早期予約: 30 }

    Array(@selected_discount).sum do |discount_rate|
      false_validate_discount_rate? unless validate_discount_rate(discount_list[discount_rate])
      (@default_price * discount_list[discount_rate]) / 100
    end
  end
end
