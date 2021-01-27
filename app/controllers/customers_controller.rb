class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @item_order = ItemOrder.find(params[:current_customer.item_order.id])
  end
end
