class ProductsController < ApplicationController
  def index
    @order = current_order
    @products = Product.all
    @order_item = current_order.order_items.new
  end
end
