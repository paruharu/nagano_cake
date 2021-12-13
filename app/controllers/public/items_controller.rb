class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :is_active, :genre)
  end

end
