class Admin::OrdersController < ApplicationController

 def show
  @order = Order.find(params[:id])
  @order_details = OrderDetail.all

 end

 def update
 end


 private
 def order_params
  params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
 end

end
