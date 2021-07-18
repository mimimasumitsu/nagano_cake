class AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses = Address.all
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to addresses_path(@address)
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path(@address)
    end
  end

  def destroy
  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end

end
