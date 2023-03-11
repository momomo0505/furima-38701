class ItemsController < ApplicationController
  def new 
    @item = Item.new
    authenticate_user!
  end

  def index
    #@items = Item.includes(:user)
  end

def create
  @item = Item.new(item_params)
  if @item.save
    redirect_to root_path
  else
    render :new
  end
end

private

def item_params
  params.require(:item).permit(:image, :name, :description, :category_id, :item_condition_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
end
end