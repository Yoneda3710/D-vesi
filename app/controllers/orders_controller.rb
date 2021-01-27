class OrdersController < ApplicationController
  before_action :set_order, only:[:index, :create]

  def index
    @order = Item.find(params[:item_id])
  end
  
  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:price)
  end
  

  def set_order
    @order = Item.find(params[:item_id])
  end

end
