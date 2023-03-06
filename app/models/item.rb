class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_charge
<<<<<<< HEAD
  belongs_to :prefecture
  belongs_to :days_to_ship
=======

>>>>>>> parent of 17040ac (基本的に変更されないデータ実装２)


  validates :name, :text, :image, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
<<<<<<< HEAD
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"}
=======
  
>>>>>>> parent of 17040ac (基本的に変更されないデータ実装２)

  belongs_to :user
  has_one :order
  has_one_attached :image


end
