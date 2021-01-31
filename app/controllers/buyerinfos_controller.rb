class BuyerinfosController < ApplicationController
  def index
    @buyerinfo = Buyerinfo.new
    set_item
  end

  def create
    @buyerinfo = Buyerinfo.new(buyer_params)
    set_item
    if  @buyerinfo.valid?
      pay_item 
      @buyerinfo.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def buyer_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(item_id: params[:item_id], token: params[:token])
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
end
