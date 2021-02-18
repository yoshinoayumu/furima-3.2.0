class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update]
  before_action :move_to_index, only:[:edit, :update]

  def index
    @items = Item.includes(:user).order("created_at DESC")
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    if @item.update(item_params)
      return redirect_to item_path(@item)
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      return redirect_to root_path
    else
      render 'show'
    end
  end


  private
  def item_params
    params.require(:item).permit(:image, :name, :info, :price, :scheduled_delivery_id, :shipping_fee_status_id, :prefecture_id, :sales_status_id, :category_id).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    return redirect_to root_path if current_user.id != @item.user_id
  end
end
