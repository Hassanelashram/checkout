module OrderItems
  class CreateOrderItem
    def initialize(order, product_id)
      @order = order
      @product_id = product_id
    end

    def call
      order_item = order.order_items.find_or_initialize_by(product_id: product_id)

      order_item.quantity += 1 if order_item.persisted?

      return order_item if order_item.save
    end

    private

    attr_accessor :order, :product_id
  end
end
