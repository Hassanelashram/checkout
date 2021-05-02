class Order < ApplicationRecord
  has_many :order_items

  # could be persisted in the db but i saw no need of querying the db everytime something changes
  # on the order, I think the way to go here would be to persist the total once the user checks out
  def calculate_total
    order_items.sum(:total)
  end
end
