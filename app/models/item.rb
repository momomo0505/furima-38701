class Item < ApplicationRecord

  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :user_id
  validates :image
  validates :name
  validates :description
  validates :category_id
  validates :item_condition_id
  validates :shipping_charge_id
  validates :prefecture_id
  validates :days_to_ship_id
  validates :price


end
