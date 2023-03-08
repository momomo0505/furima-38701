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
    validates :category_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :item_condition_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :shipping_charge_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :days_to_ship_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  belongs_to :user
  has_one :order
  has_one_attached :image


end
