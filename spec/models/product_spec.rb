require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'should have name' do
      @product = Product.new({name: "name"})
      expect(@product.name).to be_present
    end

    it 'should have price' do
      @product = Product.new({price: 10})
      expect(@product.price).to be_present
    end
    
    it 'should have quantity' do
      @product = Product.new({quantity: 2})
      expect(@product.quantity).to be_present
    end
    
    it 'should have category' do
      @product = Product.new({category_id: 2})
      expect(@product.category_id).to be_present
    end
    
  end
end
