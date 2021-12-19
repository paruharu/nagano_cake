class Public::OrdersController < ApplicationController

  def new
    @customer = current_customer
  end

  def confirm
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end

  def order_params
    params.require(:customer).permit(:name, :postal_code, :address, :shipping_cost, :total_payment, :payment_method, :status)
  end

end
