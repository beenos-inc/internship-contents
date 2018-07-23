# 追加料金を算出するクラス
class AdditionalFeeCollection
  def initialize(array_additional_fee)
    @array_additional_fee = array_additional_fee
  end

  # 追加料金を算出するメソッド
  def additional_fee
    Array(@array_additional_fee).sum
  end
end
