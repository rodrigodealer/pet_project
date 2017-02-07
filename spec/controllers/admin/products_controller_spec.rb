require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do
  it 'renders json' do
    get :index
    expect(response.status).to eq(200)
  end
end
