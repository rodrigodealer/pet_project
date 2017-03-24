class AddressesController < ApplicationController
  before_action :validate_logged_user
  before_action -> { logged_user_same_user(Address) }, only: [ :edit, :update, :destroy ]

  def index
    @addresses = Address.where(user_id: current_user.id)
  end

  def new
    @address = Address.new
  end

  def edit
  end

  def create
    address = Address.new(address_params)
    address.user = current_user
    if address.save
      flash[:success] = 'Endereço salvo'
      redirect_to :profile
    else
      flash[:error] = 'Erro ao criar endereço. Verifique seus dados.'
      redirect_to :profile
    end
  end

  def update
    if @resource.update_attributes(address_params)
      flash[:success] = 'Endereço atualizado'
      redirect_to :profile
    else
      flash[:error] = 'Erro ao atualizar endereço. Verifique seus dados.'
      redirect_to :profile
    end
  end

  def destroy
    if @resource.destroy
      flash[:success] = 'Endereço apagado'
      redirect_to :profile
    else
      flash[:error] = 'Erro ao apagar endereço. Verifique seus dados.'
      redirect_to :profile
    end
  end

  private
  def address_params
    params.require(:address).permit(:label, :street, :number, :other, :neighborhood, :zip, :kind, :city, :state)
  end
end
