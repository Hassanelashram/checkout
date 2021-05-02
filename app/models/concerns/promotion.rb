module Promotion
  extend ActiveSupport::Concern
  def apply_promotion
    if product == tshirt
      ten_percent_off_above_three
    elsif product == data_voucher
      three_for_two
    end
  end

  private

  def three_for_two
    (0..quantity).step(3) do |step|
      self.total -= product.price unless step.zero?
    end
  end

  def ten_percent_off_above_three
    self.total = quantity * product.price - quantity if quantity >= 3
  end

  def tshirt
    Product.find_by(name: "T-Shirt")
  end

  def data_voucher
    Product.find_by(name: "Data Voucher")
  end
end
