require 'rails_helper'

RSpec.describe AddressesController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'GET #index' do
    it 'renders with logged user' do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in FactoryGirl.create(:user)

      get :index

      expect(response).to be_ok
    end

    it 'redirects without logged user' do
      get :index

      expect(response).to be_redirect
      expect(flash[:notice]).to match(/logado/)
    end
  end

  describe 'GET #new' do
    it 'renders with logged user' do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in FactoryGirl.create(:user)

      get :new

      expect(response).to be_ok
    end

    it 'redirects without logged user' do
      get :new

      expect(response).to be_redirect
      expect(flash[:notice]).to match(/logado/)
    end
  end

  describe 'GET #edit' do
    let(:address) { double(Address) }
    let(:user) { FactoryGirl.create(:user) }

    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
    end

    it 'renders with logged user' do
      sign_in user
      allow(address).to receive(:user_id) { user.id }
      allow(Address).to receive(:find) { address }

      get :edit, params: { id: 1 }

      expect(response).to be_ok
    end

    it 'unauthorized with logged user different as address user' do
      sign_in user
      allow(address).to receive(:user_id) { 0 }
      allow(Address).to receive(:find) { address }

      get :edit, params: { id: 1 }

      expect(response).to be_unauthorized
    end

    it 'redirects without logged user' do
      get :edit, params: { id: 1 }

      expect(response).to be_redirect
      expect(flash[:notice]).to match(/logado/)
    end
  end

  describe 'DELETE #destroy' do
    let(:address) { double(Address) }
    let(:user) { FactoryGirl.create(:user) }

    it 'redirects without logged user' do
      delete :destroy, params: { id: 1 }

      expect(response).to be_redirect
      expect(flash[:notice]).to match(/logado/)
    end

    it 'unauthorized with logged user different as address user' do
      sign_in user
      allow(address).to receive(:user_id) { 0 }
      allow(Address).to receive(:find) { address }

      delete :destroy, params: { id: 1 }

      expect(response).to be_unauthorized
    end

    it 'renders with logged user' do
      sign_in user
      allow(address).to receive(:user_id) { user.id }
      allow(address).to receive(:destroy) { true }
      allow(Address).to receive(:find) { address }

      delete :destroy, params: { id: 1 }

      expect(response).to be_redirect
      expect(flash[:success]).to match(/Endereço apagado/)
    end

    it 'renders with logged user' do
      sign_in user
      allow(address).to receive(:user_id) { user.id }
      allow(address).to receive(:destroy) { false }
      allow(Address).to receive(:find) { address }

      delete :destroy, params: { id: 1 }

      expect(response).to be_redirect
      expect(flash[:error]).to match(/Erro ao apagar endereço/)
    end
  end

  describe 'PATCH #update' do
    let(:address) { double(Address) }
    let(:user) { FactoryGirl.create(:user) }

    it 'redirects without logged user' do
      patch :update, params: { id: 1, address: { label: 'Test' } }

      expect(response).to be_redirect
      expect(flash[:notice]).to match(/logado/)
    end

    it 'unauthorized with logged user different as address user' do
      sign_in user
      allow(address).to receive(:user_id) { 0 }
      allow(Address).to receive(:find) { address }

      patch :update, params: { id: 1, address: { label: 'Test' } }

      expect(response).to be_unauthorized
    end

    it 'renders with logged user' do
      sign_in user
      allow(address).to receive(:user_id) { user.id }
      allow(address).to receive(:update_attributes) { true }
      allow(Address).to receive(:find) { address }

      patch :update, params: { id: 1, address: { label: 'Test' } }

      expect(response).to be_redirect
      expect(flash[:success]).to match(/Endereço atualizado/)
    end

    it 'renders with logged user' do
      sign_in user
      allow(address).to receive(:user_id) { user.id }
      allow(address).to receive(:update_attributes) { false }
      allow(Address).to receive(:find) { address }

      patch :update, params: { id: 1, address: { label: 'Test' } }

      expect(response).to be_redirect
      expect(flash[:error]).to match(/Erro ao atualizar endereço/)
    end
  end

  describe 'POST #create' do
    let(:address) { double(Address) }
    let(:user) { FactoryGirl.create(:user) }

    it 'redirects without logged user' do
      post :create, params: { address: { label: 'Test' } }

      expect(response).to be_redirect
      expect(flash[:notice]).to match(/logado/)
    end

    it 'renders with logged user' do
      sign_in user
      allow(address).to receive(:user=) { user }
      allow(address).to receive(:save) { true }
      allow(Address).to receive(:new) { address }

      post :create, params: { address: { label: 'Test' } }

      expect(response).to be_redirect
      expect(flash[:success]).to match(/Endereço salvo/)
    end

    it 'renders with logged user' do
      sign_in user
      allow(address).to receive(:user=) { user }
      allow(address).to receive(:save) { false }
      allow(Address).to receive(:new) { address }

      post :create, params: { address: { label: 'Test' } }

      expect(response).to be_redirect
      expect(flash[:error]).to match(/criar endereço/)
    end
  end
end
