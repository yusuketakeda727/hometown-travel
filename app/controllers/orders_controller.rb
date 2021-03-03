class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def new
    @order_address = OrderAddress.new
    @item = Item.find(params[:id])
    redirect_to root_path if @item.order.present?
    redirect_to root_path if current_user == @item.user
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:format])
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:format], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
