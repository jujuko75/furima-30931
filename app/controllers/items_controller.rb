class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index]
  def index
  end

  def new
    @items = Item.new
  end
end
