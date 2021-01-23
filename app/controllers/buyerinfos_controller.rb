class BuyerinfosController < ApplicationController
  def index
    @buyerinfo = Buyerinfo.new
  end

  def create
    #binding.pry
    @buyerinfo = Buyerinfo.new(buyer_params)
    #binding.pry
    if @buyerinfo.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def buyer_params
    params.require(:buyerinfo).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number)
  end
end
