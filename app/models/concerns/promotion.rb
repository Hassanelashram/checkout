module Promotion
  extend ActiveSupport::Concern
  def apply_promotion
    if product == tshirt
      three_for_ten_percent_off
    else
      three_for_two
    end
  end

  private

  def three_for_two
    (0..quantity).step(3) do |step|
      self.total -= product.price unless step.zero?
    end
  end

  def three_for_ten_percent_off
    (0..quantity).step(3) do |step|
      self.total -= 1 unless step.zero?
    end
  end

  def tshirt
    Product.find_by!(name: "T-Shirt")
  end

  def data_voucher
    Product.find_by!(name: "Data Voucher")
  end
end
