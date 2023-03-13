class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  #has_one :order
  has_one_attached :image

  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_charge
  belongs_to :prefecture  
  belongs_to :days_to_ship

 

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :price, numericality:{ with: /\A[0-9]+\z/, message: 'should be half-width numbers' }
  end

  with_options numericality: { other_than: 0 }do
  validates :category_id
  validates :item_condition_id
  validates :shipping_charge_id
  validates :prefecture_id
  validates :days_to_ship_id  
  end

validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
                                { with: /\A[0-9]+\z/, message: 'should be half-width numbers' }
end
