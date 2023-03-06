class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition



  validates :name, :text, :image, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_condition_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :user
  has_one :order
  has_one_attached :image


end
