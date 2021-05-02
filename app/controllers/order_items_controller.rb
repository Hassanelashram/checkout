class OrderItemsController < ApplicationController


    def create
        @order = current_order
        @product = Product.find(params[:product_id])
        @order_item = current_order.order_items.find_or_initialize_by(product_id: @product.id)
    
        if @order_item.quantity.nil?
            @order_item.quantity = params[:order_item][:quantity].to_i
        else
            @order_item.quantity += params[:order_item][:quantity].to_i
        end

        @order_item.product = @product

        if @order_item.save
            redirect_to root_url
            flash[:success] = "Added to cart"
            session[:order_id] = @order.id
        else 
            redirect_to root_url
            flash[:notice] = @order_item.errors.full_messages
        end
    end


    private

    def item_params
        params.require(:order_item).permit(:quantity)
    end
end
