require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'GET #profile' do
    it 'renders with logged user' do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in FactoryGirl.create(:user)

      get :profile

      expect(response).to be_ok
    end

    it 'redirects with logged user' do
      get :profile

      expect(response).to be_redirect
      expect(flash[:notice]).to match(/logado/)
    end
  end

  describe 'PATCH #profile' do
    it 'tries to patch unlogged' do
      patch :update_profile, params: { user: { id: 10, pets: 'cats' } }

      expect(response).to be_redirect
      expect(flash[:notice]).to match(/logado/)
    end

    it 'saves' do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in FactoryGirl.create(:user)

      patch :update_profile, params: { user: { pets: 'cats' } }

      expect(response).to be_redirect
      expect(flash[:success]).to match(/Usuário atualizado/)
    end

    it 'saves' do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in FactoryGirl.create(:user)

      patch :update_profile, params: { user: { pets: 'cats', password: '12345678A', password_confirmation: '12345678A' } }

      expect(response).to be_redirect
      expect(flash[:success]).to match(/Usuário atualizado/)
    end

    it 'doesnt save' do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in FactoryGirl.create(:user)

      patch :update_profile, params: { user: { pets: 'cats', password: '12345678A', password_confirmation: '1234' } }

      expect(response).to be_redirect
      expect(flash[:error]).to match(/Erro ao atualizar usuário/)
    end
  end
end
