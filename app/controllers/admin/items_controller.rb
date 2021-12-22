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
    @item.genre_id = params[:item][:genre_id]

    if @item.save
       flash[:notice] = "商品を登録しました。"
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
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
       flash[:notice] = "更新できました."
       redirect_to admin_item_path(@item.id)
    else
       render :edit
    end
  end

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :is_active, :genre)
  end

end
