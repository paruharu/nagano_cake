class Public::OrdersController < ApplicationController

  def new
      @customer = current_customer
      @order = Order.new
  end

  def confirm
      @cart_items = CartItem.all
      @order = Order.new()
      @order.payment_method = order_params[:payment_method]
      @order.customer_id = current_customer.id
      @order.shipping_cost = 800
      # @order.status = 0

      if params[:order][:select_address] == "0"
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name = current_customer.last_name + current_customer.first_name

      elsif params[:order][:select_address] == "1"
        @address = Address.find(params[:order][:address_id])
        @order.postal_code = @address.postal_code
        @order.address = @address.address
        @order.name = @address.name

      end
      render:confirm

  end

  def complete

  end

  def create
    @order = Order.find(params[:id])
    @order.save
    redirect_to orders_complete_path
  end

  def index

  end

  def show
  end

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :select_address, :address_id, :status)
  end

end
