class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(book_params)
    @item.save
  end

  def show
  end

  def edit
  end

  def update
  end

  def genre_params
    params.require(:item).permit(:name, :)
  end

end
