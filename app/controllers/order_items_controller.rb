class OrderItemsController < ApplicationController
    before_action :set_item, only: [:update, :destroy]

    def create
        @order = current_order
        @product = Product.find(params[:product_id])
        @order_item = current_order.order_items.find_or_initialize_by(product_id: @product.id)
    
        if @order_item.quantity.nil?
            @order_item.quantity = 1
        else
            @order_item.quantity += 1
        end

        @order_item.product = @product

        if @order_item.save
            redirect_to root_url
            flash[:notice] = "Added to cart"
            session[:order_id] = @order.id
        else 
            redirect_to root_url
            flash[:notice] = @order_item.errors.full_messages
        end
    end

    def update
        if @order_item.update(item_params)
            redirect_to root_url
            flash[:notice] = "Quantity updated"
        else 
            redirect_to root_url
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
