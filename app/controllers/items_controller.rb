class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:update, :destroy]

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
  end

  def edit
    return if current_user.id == @item.user_id && @item.purchase.nil?

    redirect_to action: :index
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :product_description, :product_category_id, :product_condition_id, :shipping_charge_id,
                                 :prefecture_id, :days_to_ship_id, :selling_price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    return if current_user.id == @item.user_id

    redirect_to action: :index
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
