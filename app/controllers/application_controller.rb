class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def validate_logged_user
    if current_user.nil?
      flash[:notice] = 'Você não está logado.'
      redirect_to root_path
    end
  end
end
