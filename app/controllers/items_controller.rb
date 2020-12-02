class ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image).merge(producer_id: current_producer.id)
  end

end

