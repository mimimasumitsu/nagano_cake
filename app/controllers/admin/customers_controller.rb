class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.with_deleted
  end

  def show
    @customer = Customer.with_deleted.find(params[:id])
  end

  def edit
    @customer = Customer.with_deleted.find(params[:id])
  end

  def update
    @customer = Customer.with_deleted.find(params[:id])
    if params[:customer][:deleted_at] == "nil"
      @customer.restore
    else
      @customer.destroy
    end
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_active)
  end

end
