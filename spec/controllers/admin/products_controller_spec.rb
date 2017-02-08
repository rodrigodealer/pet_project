require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do

  describe 'renders' do
    it 'renders index' do
      subject { get :index }

      expect(response.status).to eq(200)
    end

    it 'renders new' do
      subject { get :new }

      expect(response.status).to eq(200)
    end

    it 'renders edit' do
      allow(Product).to receive(:find) { Product.new }
      allow(Brand).to receive(:all) { [] }

      subject { get :edit, params: { id: 1 } }

      expect(response.status).to eq(200)
    end

    it 'renders properties edit' do
      allow(Product).to receive(:find) { Product.new }

      subject { get :properties_edit, params: { product_id: 1 } }

      expect(response.status).to eq(200)
    end
  end

  describe 'perform actions' do
    let(:product) { double(Product) }
    let(:brand) { double(Brand) }

    it 'delete' do
      allow(product).to receive(:destroy) { true }
      allow(Product).to receive(:find) { product }

      delete :destroy, params: { id: 1 }

      expect(response).to redirect_to(:action => :index)
    end

    it 'not delete' do
      allow(product).to receive(:destroy) { true }
      allow(Product).to receive(:find) { product }

      delete :destroy, params: { id: 1 }

      expect(response).to redirect_to(:action => :index)
    end

    it 'create' do
      allow(Product).to receive(:find) { product }
      allow(Brand).to receive(:find) { brand }

      post :create, params: { product: { name: 'Test', brand_id: 1, price: 30, available: 30 } }

      expect(response).to redirect_to(:action => :index)
    end

    it 'not create' do
      allow(product).to receive(:save) { false }
      allow(Product).to receive(:new) { product }

      post :create, params: { product: { name: 'Test', brand_id: 1, price: 30, available: 30 } }

      expect(response).to_not redirect_to(:action => :index)
    end
  end
end
