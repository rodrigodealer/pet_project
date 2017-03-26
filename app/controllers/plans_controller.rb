class PlansController < ApplicationController
  before_action :validate_logged_user
  before_action -> { logged_user_same_user(Plan) }, only: [ :edit, :update, :destroy ]

  def index
    @plans = Plan.where(user_id: current_user.id)
  end

  def new
    @plan = Plan.new
  end

  def edit
  end

  def create
    plan = Plan.new(plan_params)
    plan.user = current_user
    if plan.save
      flash[:success] = 'Plano salvo'
      redirect_to :profile
    else
      flash[:error] = 'Erro ao criar plano. Verifique seus dados.'
      redirect_to :profile
    end
  end

  def update
    if @resource.update_attributes(plan_params)
      flash[:success] = 'Plano atualizado'
      redirect_to :profile
    else
      flash[:error] = 'Erro ao atualizar plano. Verifique seus dados.'
      redirect_to :profile
    end
  end

  def destroy
    if @resource.destroy
      flash[:success] = 'Plano apagado'
      redirect_to :profile
    else
      flash[:error] = 'Erro ao apagar plano. Verifique seus dados.'
      redirect_to :profile
    end
  end

  private
  def plan_params
    params.require(:plan).permit(:period, :label)
  end
end
