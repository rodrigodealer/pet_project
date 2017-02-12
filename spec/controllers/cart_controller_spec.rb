require 'rails_helper'

RSpec.describe CartController, type: :controller do
  let(:cart) { double(Cart) }
  it 'renders index' do
    get :index
    expect(response).to be_ok
  end

  it 'doesnt a cart without cart param' do
    post :create, params: {}

    expect(response).to be_redirect
  end

  it 'doesnt a cart without product_id' do
    post :create, params: { :cart => { }}

    expect(response).to be_redirect
  end

  it 'doesnt a cart without qty' do
    post :create, params: { :cart => { :product_id => 1 }}

    expect(response).to be_redirect
  end

  it 'doesnt a cart without property' do
    post :create, params: { :cart => { :product_id => 1, :qty => 1 }}

    expect(response).to be_redirect
  end

  it 'creates a cart' do
    allow(cart).to receive(:with_items) { cart }
    allow(cart).to receive(:save) { true }
    allow(Cart).to receive(:get) { cart }

    post :create, params: { :cart => { :product_id => 1, :qty => 1, :property => {'Tamanho' => 'G', 'Cor' => 'Preto', 'Tipo' => 'Gato'} }}

    expect(response).to be_ok
  end
end
