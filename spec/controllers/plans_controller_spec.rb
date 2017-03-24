require 'rails_helper'

RSpec.describe PlansController, type: :controller do
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
    let(:plan) { double(Plan) }
    let(:user) { FactoryGirl.create(:user) }

    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
    end

    it 'renders with logged user' do
      sign_in user
      allow(plan).to receive(:user_id) { user.id }
      allow(Plan).to receive(:find) { plan }

      get :edit, params: { id: 1 }

      expect(response).to be_ok
    end

    it 'unauthorized with logged user different as address user' do
      sign_in user
      allow(plan).to receive(:user_id) { 0 }
      allow(Plan).to receive(:find) { plan }

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
    let(:plan) { double(Plan) }
    let(:user) { FactoryGirl.create(:user) }

    it 'redirects without logged user' do
      delete :destroy, params: { id: 1 }

      expect(response).to be_redirect
      expect(flash[:notice]).to match(/logado/)
    end

    it 'unauthorized with logged user different as address user' do
      sign_in user
      allow(plan).to receive(:user_id) { 0 }
      allow(Plan).to receive(:find) { plan }

      delete :destroy, params: { id: 1 }

      expect(response).to be_unauthorized
    end

    it 'renders with logged user' do
      sign_in user
      allow(plan).to receive(:user_id) { user.id }
      allow(plan).to receive(:destroy) { true }
      allow(Plan).to receive(:find) { plan }

      delete :destroy, params: { id: 1 }

      expect(response).to be_redirect
      expect(flash[:success]).to match(/Plano apagado/)
    end

    it 'renders with logged user' do
      sign_in user
      allow(plan).to receive(:user_id) { user.id }
      allow(plan).to receive(:destroy) { false }
      allow(Plan).to receive(:find) { plan }

      delete :destroy, params: { id: 1 }

      expect(response).to be_redirect
      expect(flash[:error]).to match(/Erro ao apagar plano/)
    end
  end

  describe 'PATCH #update' do
    let(:plan) { double(Plan) }
    let(:user) { FactoryGirl.create(:user) }

    it 'redirects without logged user' do
      patch :update, params: { id: 1, plan: { label: 'Test' } }

      expect(response).to be_redirect
      expect(flash[:notice]).to match(/logado/)
    end

    it 'unauthorized with logged user different as address user' do
      sign_in user
      allow(plan).to receive(:user_id) { 0 }
      allow(Plan).to receive(:find) { plan }

      patch :update, params: { id: 1, plan: { label: 'Test' } }

      expect(response).to be_unauthorized
    end

    it 'renders with logged user' do
      sign_in user
      allow(plan).to receive(:user_id) { user.id }
      allow(plan).to receive(:update_attributes) { true }
      allow(Plan).to receive(:find) { plan }

      patch :update, params: { id: 1, plan: { label: 'Test' } }

      expect(response).to be_redirect
      expect(flash[:success]).to match(/Plano atualizado/)
    end

    it 'renders with logged user' do
      sign_in user
      allow(plan).to receive(:user_id) { user.id }
      allow(plan).to receive(:update_attributes) { false }
      allow(Plan).to receive(:find) { plan }

      patch :update, params: { id: 1, plan: { label: 'Test' } }

      expect(response).to be_redirect
      expect(flash[:error]).to match(/Erro ao atualizar plano/)
    end
  end

  describe 'POST #create' do
    let(:plan) { double(Plan) }
    let(:user) { FactoryGirl.create(:user) }

    it 'redirects without logged user' do
      post :create, params: { plan: { label: 'Test' } }

      expect(response).to be_redirect
      expect(flash[:notice]).to match(/logado/)
    end

    it 'renders with logged user' do
      sign_in user
      allow(plan).to receive(:user=) { user }
      allow(plan).to receive(:save) { true }
      allow(Plan).to receive(:new) { plan }

      post :create, params: { plan: { label: 'Test' } }

      expect(response).to be_redirect
      expect(flash[:success]).to match(/Plano salvo/)
    end

    it 'renders with logged user' do
      sign_in user
      allow(plan).to receive(:user=) { user }
      allow(plan).to receive(:save) { false }
      allow(Plan).to receive(:new) { plan }

      post :create, params: { plan: { label: 'Test' } }

      expect(response).to be_redirect
      expect(flash[:error]).to match(/criar plano/)
    end
  end
end
