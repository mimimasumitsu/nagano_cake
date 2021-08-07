class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @order = current_customer.orders
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    if params[:order][:delivery_address] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    elsif params[:order][:delivery_address] == "2"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else
      @order.save
    end
    @order.shipping_cost = 800
    total = 0
    current_customer.cart_items.each do |cart_item|
      total += cart_item.item.add_tax_price * cart_item.amount
    end
    @order.total_payment = total + @order.shipping_cost
  end

  def thanks
  end

  def create
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      @cart_items.each do |cart_item|
        order_item = OrderItem.new(item_id: cart_item.item_id, order_id: @order.id, price: cart_item.item.price, amount: cart_item.amount)
        order_item.save
      end
      @cart_items.destroy_all
      redirect_to orders_thanks_path
    end
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :shipping_cost, :total_payment)
  end

end
