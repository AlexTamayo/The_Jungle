require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    # Test that a product with all four fields set saves successfully
    it 'saves successfully when all fields are set' do
      @category = Category.new(name: 'Plants')
      @product = Product.new(name: 'Sunflower', price_cents: 10000, quantity: 10, category: @category)
      expect(@product).to be_valid
    end
    
    # Test for name validation
    it 'is not valid without a name' do
      @category = Category.new(name: 'Plants')
      @product = Product.new(name: nil, price_cents: 10000, quantity: 10, category: @category)
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    
    # Test for price validation using price_cents
    it 'is not valid without a price' do
      @category = Category.new(name: 'Plants')
      @product = Product.new(name: 'Sunflower', price_cents: nil, quantity: 10, category: @category)
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    # Test for quantity validation
    it 'is not valid without a quantity' do
      @category = Category.new(name: 'Plants')
      @product = Product.new(name: 'Sunflower', price_cents: 10000, quantity: nil, category: @category)
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    # Test for category validation
    it 'is not valid without a category' do
      @product = Product.new(name: 'Sunflower', price_cents: 10000, quantity: 10, category: nil)
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end

