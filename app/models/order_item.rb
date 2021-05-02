class OrderItem < ApplicationRecord
  include Promotion
  belongs_to :order
  belongs_to :product

  # validations
  validates :quantity, numericality: { greater_than: 0 }
  # callbacks
  before_save :calculate_total

  def calculate_total
    self.total = product.price * quantity
    apply_promotion
  end
end
