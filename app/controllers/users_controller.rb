class UsersController < ApplicationController
  before_action :validate_logged_user, only: [:profile, :update_profile]

  def profile
    @user = current_user
    @addresses = Address.where(user_id: current_user.id)
  end

  def update_profile
    @user = User.find(current_user.id)

    if @user.update_attributes(profile_params)
      flash[:success] = 'Usuário atualizado'
      redirect_to :profile
    else
      flash[:error] = 'Erro ao atualizar usuário. Verifique seus dados.'
      redirect_to :profile
    end
  end

  private
  def profile_params
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params.require(:user).permit(:name, :email, :pets)
    else
      params.require(:user).permit(:name, :email, :pets, :password, :password_confirmation)
    end
  end
end
