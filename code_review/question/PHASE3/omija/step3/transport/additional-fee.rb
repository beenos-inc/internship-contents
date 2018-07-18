# 追加料金を算出するクラス
class AdditionalFee
  def initialize(selected_additional)
    @selected_additional = selected_additional
  end

  # 追加料金を算出するメソッド
  def additional_fee
    additional_list = { グリーン車: 5_000 }

    Array(@selected_additional).sum { |add_option| additional_list[add_option] }
  end
end
