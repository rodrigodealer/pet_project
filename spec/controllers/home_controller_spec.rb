require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  it 'renders' do
    get :index
    expect(response).to be_ok
  end
end
