class ApplicationController < ActionController::Base
  # storing the order on the session.
  def current_order
    order = Order.find_by(id: session[:order_id])
    return Order.new unless order

    order
  end
end
