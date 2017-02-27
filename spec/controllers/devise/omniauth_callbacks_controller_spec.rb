require 'rails_helper'

RSpec.describe OmniauthCallbacksController, type: :controller do
  include Devise::Test::ControllerHelpers

  before :each do
    request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in FactoryGirl.create(:user)
  end

  it 'should post to facebook and create with email' do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]

    post :facebook

    expect(response).to redirect_to root_path
  end

  it 'should post to facebook and create without email and api returns' do
    RestClient = double
    response = double
    allow(response).to receive(:code) { 200 }
    allow(response).to receive(:body) { {'email' => 'johndoe@doe.com'}.to_json }
    allow(RestClient).to receive(:get) { response }

    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook_no_mail]

    post :facebook

    expect(response).to redirect_to root_path
  end

  it 'should post to facebook and create without email and api doesnt returns' do
    RestClient = double
    RestClient = double
    response = double
    allow(response).to receive(:code) { 200 }
    allow(response).to receive(:body) { {'email' => nil}.to_json }
    allow(RestClient).to receive(:get) { response }

    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook_no_mail]

    post :facebook

    expect(response).to redirect_to new_user_registration_path
  end
end
