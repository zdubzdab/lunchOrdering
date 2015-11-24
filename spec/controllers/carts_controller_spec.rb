require 'rails_helper'

describe CartsController do

  describe 'POST #create' do
    it 'creates the cart' do
      post :create, cart: attributes_for(:cart)
      expect(Cart.count).to eq(1)
    end
  end

  # describe 'DELETE destroy' do
  #   it 'creates the cart' do
  #     post :create, cart: attributes_for(:cart)
  #     expect(Cart.count).to eq(1)
  #   end
  # end
end