class Admin::OrdersController < ApplicationController

  def show
    @order = OrderItem.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:item_id, :order_id, :address, :price, :amount, :making_status, :created_at, :updated_at)
  end

end
