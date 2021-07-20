class OrdersController < ApplicationController

  def new
  end

  def confirm
  end

  def thanks
  end

  def create
  end

  def index
    @ordres = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

end
