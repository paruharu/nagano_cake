class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
  end

  def update
     @cart_item = CartItem.find(params[:id])
     @cart_item.update(cart_item_params)
     flash[:notice] = "変更しました"
     redirect_to cart_itmes_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_items = CartItem.all
    cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
    # {..., "cart_item"=> {"amount"=> "値", "item_id"=> "値"}}
  end

end
