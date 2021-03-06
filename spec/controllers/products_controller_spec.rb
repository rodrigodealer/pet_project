require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  it 'renders json' do
    get :index

    expect(response).to be_ok
  end

  it 'performs search' do

    allow(Product).to receive(:search) { RecordStub.new }

    get :search, params: { name: 'hi' }

    expect(response).to be_ok
  end

  it 'redirect when post to search' do
    post :search_from_post, params: { q: 'hi' }

    expect(response).to be_redirect
  end

  it 'bad request when post to empty to serch' do
    post :search_from_post, params: { q: '' }

    expect(response).to be_bad_request
  end

  it 'bad request when post to nil to serch' do
    post :search_from_post

    expect(response).to be_bad_request
  end

  it 'redirect null when search' do
    allow(Product).to receive(:search) { RecordStub.new }

    get :search, params: { name: '' }

    expect(response).to be_redirect
  end

  it 'show product page' do
    allow(Product).to receive(:find) { Product.new }

    get :show, params: { id: 10 }

    expect(response).to be_ok
  end

  it 'redirect when empty id' do
    get :show, params: { id: '' }

    expect(response).to be_redirect
  end

  it 'redirect when null id' do
    get :show, params: { id: nil }

    expect(response).to be_redirect
  end

  it 'redirect when no id' do
    get :show

    expect(response).to be_redirect
  end

  class RecordStub
    def records
      []
    end
  end
end
