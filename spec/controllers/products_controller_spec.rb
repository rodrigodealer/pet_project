require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  it 'renders json' do
    get :index
    expect(response.status).to eq(200)
  end

  it 'performs search' do

    allow(Product).to receive(:search) { RecordStub.new }

    get :search, params: { q: 'hi' }

    expect(response).to be_ok
  end

  it 'redirect null when search' do
    allow(Product).to receive(:search) { RecordStub.new }

    get :search, params: { q: '' }

    expect(response).to be_redirect
  end

  class RecordStub
    def records
      []
    end
  end
end
