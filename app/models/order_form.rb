# Formオブジェクト

#class OrderForm < ApplicationRecord（不要）
class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :block, :building, :tel

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :block
    validates :tel, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    # validates :token
    end
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }



def save
  order = Order.create(user_id: user_id, item_id: item_id)
   Address.create(order_id: order.id, post_code: post_code, prefecture_id: prefecture_id, city: city, block: block, building: building, tel: tel)
end
end