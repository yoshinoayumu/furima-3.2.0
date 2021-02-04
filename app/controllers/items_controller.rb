class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      return redirect_to root_path
    end
    render 'new'
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :info, :price, :scheduled_delivery_id, :shipping_fee_status_id, :prefecture_id, :sales_status_id, :category_id).merge(user_id: current_user.id)
    
  end
end
