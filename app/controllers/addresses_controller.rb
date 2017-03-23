class AddressesController < ApplicationController
  before_action :validate_logged_user
  before_action :logged_user_same_user_address, :only => [ :edit, :update ]


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
    if @address.update_attributes(address_params)
      flash[:success] = 'Endereço atualizado'
      redirect_to :profile
    else
      flash[:error] = 'Erro ao atualizar endereço. Verifique seus dados.'
      redirect_to :profile
    end
  end

  private
  def logged_user_same_user_address
    @address = Address.find(params[:id])
    unless @address.user_id == current_user.id
      render :file => "public/401.html", :status => :unauthorized
    end
  end

  private
  def address_params
    params.require(:address).permit(:label, :street, :number, :other, :neighborhood, :zip, :kind, :city, :state)
  end
end
