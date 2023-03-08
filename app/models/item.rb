class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_to_ship

  with_options presence: true do
    validates :user_id
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :item_condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :days_to_ship_id
    # 300円以上かつ9,999,999円以下で、半角数字でないと入力不可
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  belongs_to :user
  has_one :order
  has_one_attached :image


end
