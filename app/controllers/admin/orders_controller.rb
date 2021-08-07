class Admin::OrdersController < ApplicationController

  def show
    @orders = OrderItem.all
    @order = Order.find(params[:id])
  end

end
