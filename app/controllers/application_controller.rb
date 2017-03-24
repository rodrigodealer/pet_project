class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def validate_logged_user
    if current_user.nil?
      flash[:notice] = 'Você não está logado.'
      redirect_to root_path
    end
  end

  def logged_user_same_user(resource)
    @resource = resource.find(params[:id])
    unless @resource.user_id == current_user.id
      render :file => "public/401.html", :status => :unauthorized
    end
  end
end
