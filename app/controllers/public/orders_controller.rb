class Public::OrdersController < ApplicationController

  def new
      @customer = current_customer
      @order = Order.new
  end

  def confirm
      @cart_items = CartItem.all
      @order = Order.new(order_params)
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
    # @order　= session[:order]
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    @order.customer_id = current_customer.id
    @order.total_payment = total
    @order.status = 0
    @order.save

    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new()
      @order_detail.item_id = cart_item.item_id
      @order_detail.price = cart_item.item.with_tax_price * cart_item.amount
      @order_detail.amount = cart_item.amount
      @order_detail.order_id = @order.id
      @order_detail.save
    end
    @cart_items.destroy

    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def index
   @order = current_customer.orders
  end

  def show
  end

  private

    def total
      @cart_items = current_customer.cart_items
      @total = 0
      @cart_items.each do |cart_item|
      @total += cart_item.item.with_tax_price * cart_item.amount
      end
      return @total
    end

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :status, :shipping_cost, :total_payment)
  end

end
