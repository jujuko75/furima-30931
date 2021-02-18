class BuyerinfosController < ApplicationController
  before_action :authenticate_user!, only:[:index, :create]
  before_action :set_item, only:[:index, :create]
  before_action :redirect_to_root, only:[:index, :create]

  def index
    @order_buyerinfo = OrderBuyerinfo.new
  end

  def create
    @order_buyerinfo = OrderBuyerinfo.new(buyer_params)

    if  @order_buyerinfo.valid?
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
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end
  end
end
