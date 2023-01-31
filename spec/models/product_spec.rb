require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'saves products to the db' do 
      category = Category.create(name: "Sea")
      product = Product.create(name: "starfish", price: 1000, quantity: 5, category: category)
      expect(product).to be_present
    end

    it 'is invalid without a name' do
      category = Category.create(name: "Sea")
      product = Product.create(name: nil, price: 500, quantity: 10, category: category)
      expect(product.errors.full_messages).to include "Name can't be blank"
    end

    it 'is invalid without a price' do 
      category = Category.create(name: "Sea")
      product = Product.create(name: "Plankton", quantity: 10, category: category)
      expect(product.errors.full_messages).to include "Price can't be blank"
    end

    it 'is invalid without quantity' do 
      category = Category.create(name: "Sea")
      product = Product.create(name: "Cucumber", price: 400, quantity: nil, category: category)
      expect(product.errors.full_messages).to include "Quantity can't be blank"
    end

    it 'is invalid without a category' do 
      category = Category.create(name: "Sea")
      product = Product.create(name: "Horse", quantity: 2, category: nil)
      expect(product.errors.full_messages).to include "Category can't be blank"
    end
  end
end