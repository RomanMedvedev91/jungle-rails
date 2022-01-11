require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'should save successfuly' do
      @product = Product.new({name: "Name", price: 10, quantity: 2, category_id: 2})
      @product.save
      expect(@product).to be_present
    end

    it 'should have name' do
      @product = Product.new({name: nil, price: 10, quantity: 5, category_id: 2})
      expect(@product.name).to eql(nil), @product.errors.full_messages
    end

    it 'should have price' do
      @product = Product.new({name: "Name", price_cents: nil, quantity: 2, category_id: 2})
       expect(@product.price_cents).to eql(nil), @product.errors.full_messages
    end
    
    it 'should have quantity' do
      @product = Product.new({name: "Name", price: 10, quantity: nil, category_id: 2})
      expect(@product.quantity).to eql(nil), @product.errors.full_messages
    end
    
    it 'should have category equal to nil' do
      @product = Product.new({name: "Name", price: 10, quantity: 2, category_id: nil})
       expect(@product.category_id).to eql(nil), @product.errors.full_messages
    end
    
  end
end
