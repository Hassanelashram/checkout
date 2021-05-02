require 'rails_helper'

RSpec.describe OrderItems::CreateOrderItem, type: :service do
  subject { described_class.new(order, product.id).call }
  describe "#call" do
    context "when the service is called" do
      context "and there was no item for this product and this order" do
        let(:order) { create(:order) }
        let(:product) { create(:product) }
        it "creates a new one" do
          subject

          expect(OrderItem.count).to eq 1
          expect(OrderItem.last.quantity).to eq 1
        end
        context "but an item for this product and order already existed" do
          it "increments the quantity" do
            subject

            expect(OrderItem.count).to eq 1
            expect(OrderItem.last.quantity).to eq 1
          end
        end
      end
    end
  end
end
