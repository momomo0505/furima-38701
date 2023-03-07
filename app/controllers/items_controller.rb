class ItemsController < ApplicationController
  def new 
    @item = Item.new
    authenticate_user!
  end

  def index
    @items = Item.includes(:user)
  end
end

  

def create
end

private

def item_params
  params.require(:items).permit(:name, :description, :image, :category_id, :item_condition_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, :price ).merge(user_id: current_user.id)
end