class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer

    if @customer.update(customer_params)
       flash[:notice] = "更新できました。"
       redirect_to customer_path(@customer)
    else
       render :edit
    end

  end

  def unsubscribe
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_active: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました。"
    redirect_to root_path
  end

  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_active)
  end

end
