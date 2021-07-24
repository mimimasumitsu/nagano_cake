class OrdersController < ApplicationController

  def new
    @orders = Order.all
    @order = Order.new
  end

  def confirm
  end

  def thanks
  end

  def create
    @order = Order.new(order_params)
    @order.save
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name)
  end

end
