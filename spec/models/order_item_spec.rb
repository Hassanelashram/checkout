require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  describe "calculate_total" do
    context "when order_item is created" do
      context "and the product has no promotions" do
        let!(:order_item) { create(:order_item, quantity: 3, product: product) }
        let(:product) { create(:product, price: 5) }
        fit "calculates the total the item" do
          expect(order_item.total.to_i).to eq 15
        end
      end
      context "and the product has an active promotion" do
        let!(:order_item) { create(:order_item, quantity: 3, product: tshirt) }
        let(:tshirt) { create(:product, name: "T-Shirt", price: 10) }
        context "and conditions are met" do
          it "calculate total and applies the promotions" do
            expect(order_item.total.to_i).to eq 27
          end
        end
        context "but conditions are not met" do
          before do
            order_item.update(quantity: 2)
          end
          it "calculate total and does not apply the promotions" do
            expect(order_item.total.to_i).to eq 20
          end
        end
      end
    end
  end
end
