class ApplicationController < ActionController::Base
  # storing the order on the session.
  def current_order
    return Order.new unless session[:order_id]

    Order.find(session[:order_id])
  end
end
