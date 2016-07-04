class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end

  def authenticate_student!
    unless user_signed_in? && current_user.is_student?
      redirect_to root_path, alert: 'No eres estudiante, iniciar sesión o cargar el perfil.'
    end
  end
  def authenticate_admin!
    unless user_signed_in? && current_user.is_admin?
      redirect_to root_path, alert: 'No tienes permisos para estar aquí!!.'
    end

  end
  def authenticate_super_admin!
    unless user_signed_in? && current_user.is_super_admin?
      redirect_to root_path, alert: 'No tienes permisos para estar aquí!!.'
    end
  end

  def set_kind_of_scholarships
		@kind_of_scholarships = KindOfScholarship.all
	end
end
