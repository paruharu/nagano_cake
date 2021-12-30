class Admin::OrdersController < ApplicationController

 def show
  @order = Order.find(params[:id])
  @order_details = OrderDetail.all

 end

 def update
  @order = Order.find(params[:id])
  @order.order_detail

   if @order.update(order_params)
      flash[:notice] = "更新しました"
      redirect_to admin_order_path(@order.id)
   else
      render :show
   end
 end


 private
 def order_params
  params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
 end

end
