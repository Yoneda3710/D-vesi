class ItemsController < ApplicationController
  before_action :find_item, only: :order
  def index
    @item = Item.order(created_at: :desc).limit(5)
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

  def show
    @item = Item.find(params[:id])
  end

  def order 
    #redirect_to new_card_path and return unless curent_customer.card.present?
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    customer_token = current_customer.card.customer_token # ログインしているユーザーの顧客トークンを定義
    Payjp::Charge.create(
     amount: @item.price, # 商品の値段
     customer: customer_token, # 顧客のトークン
     currency: 'jpy' # 通貨の種類（日本円）
      )

    ItemOrder.create(item_id: params[:id])
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image).merge(producer_id: current_producer.id)
  end
  
  def find_item
    @item = Item.find(params[:id])
  end
end

