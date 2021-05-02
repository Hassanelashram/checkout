class OrderItemsController < ApplicationController
  before_action :set_item, only: %i[update destroy]

  def create
    order_item = OrderItems::CreateOrderItem.new(current_order, params[:product_id]).call
    redirect_to root_url
    if order_item
      flash[:notice] = "Added to cart"
      session[:order_id] = order_item.order_id
    else
      flash[:notice] = order_item.errors.full_messages
    end
  end

  def update
    redirect_to root_url
    if @order_item.update(item_params)
      flash[:notice] = "Quantity updated"
    else
      flash[:notice] = @order_item.errors.full_messages
    end
  end

  def destroy
    @order_item.destroy
    redirect_to root_url
    flash[:notice] = "Removed from cart"
  end

  private

  def set_item
    @order_item = OrderItem.find(params[:id])
  end

  def item_params
    params.require(:order_item).permit(:quantity)
  end
end
