class BuyerinfosController < ApplicationController
  before_action :authenticate_user!, only:[:index, :create]
  before_action :redirect_to_root, only:[:index]

  def index
    @order_buyerinfo = OrderBuyerinfo.new
    set_item
  end

  def create
    set_item
    @order_buyerinfo = OrderBuyerinfo.new(buyer_params)

    if  
      @order_buyerinfo.valid?
      pay_item 
      @order_buyerinfo.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def buyer_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(token: params[:token],item_id: @item.id,user_id: current_user.id)
  end


  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency: 'jpy',
    )
  end

  def redirect_to_root
    set_item
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end
  end
end
