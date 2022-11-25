class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :product_description, :product_category_id, :product_condition_id, :shipping_charge_id,
                                 :prefecture_id, :days_to_ship_id, :selling_price, :image).merge(user_id: current_user.id)
  end
end
