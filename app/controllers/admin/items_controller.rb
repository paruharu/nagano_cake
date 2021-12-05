class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @genres = Genre.all

    if @item.save
       flash[:notice] = "商品を登録しました"
     　redirect_to admin_item_path(@item.id)
    else
      # @items = Item.all
       render :new
    end
  end


  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
  end

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :is_active, :genre)
  end

end
