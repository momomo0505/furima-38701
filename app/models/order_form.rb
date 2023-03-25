class OrderForm < ApplicationRecord
  class OrderForm
    include ActiveModel::Model
    attr_accessor :user_id,:item_id
  
    # ここにバリデーションの処理を書く
    validates :user_id presence: true
    validates :item_id presence: true
  
    def save
      # 各テーブルにデータを保存する処理を書く
      
    end
  end
end
