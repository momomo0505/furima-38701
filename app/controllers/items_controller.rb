class ItemsController < ApplicationController
  def new 
    authenticate_user!
  end

  def index
  end
end

private

def item_params
  params.require(:items).permit(:name, :description, :image, :category_id, :item_condition_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, :price ).merge(user_id: current_user.id)
end