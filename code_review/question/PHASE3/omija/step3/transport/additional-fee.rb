# 追加料金を算出するクラス
class AdditionalFee
  def initialize(selected_additional)
    @selected_additional = selected_additional
  end

  # 追加料金を算出するメソッド
  def additional_fee
    Array(@selected_additional).sum
  end
end
