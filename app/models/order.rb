class Order < ApplicationRecord
    has_many :order_items


    def calculate_total
        order_items.sum(:total)
    end
end
