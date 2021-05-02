class ApplicationController < ActionController::Base

    def current_order
        return Order.new unless session[:order_id]

        Order.find(session[:order_id])
    end
end
