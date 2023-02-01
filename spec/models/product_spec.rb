require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    let (:category) {Category.create(name: "Purses")}
    let (:product) {Product.new(name: "Chanel", price_cents:10000000, quantity: 1, category_id: category.id)} 

    it "is valid with valid attributes" do
      expect(product).to be_valid
      # IS IT PRODUCT OR CATEGORY THAT NEEDS TO BE VALID?
    end

    it "is not valid without a name" do
      product.name = nil
      product.save
      expect(product.errors.full_messages).to include("Name can't be blank")
      expect(product).to_not be_valid
    end

    it "is not valid without a price" do
      product.price_cents = nil
      product.save
      expect(product.errors.full_messages).to include("Price can't be blank")
      expect(product).to_not be_valid
    end

    it "is not valid without quantity" do
      product.quantity = nil
      product.save
      expect(product.errors.full_messages).to include("Quantity can't be blank")
      expect(product).to_not be_valid
    end

    it "is not valid without category" do
      product.category = nil
      product.save
    end


  end
end