require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  it 'renders json' do
    get :index
    expect(response.status).to eq(200)
  end
end
