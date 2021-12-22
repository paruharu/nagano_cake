class Admin::OrdersController < ApplicationController

 def new
 end

 def show

 end

 def update
 end

 def confirm
  @cart_items = CartItem.all
 end

 private
 def order_params
  params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
 end

end
