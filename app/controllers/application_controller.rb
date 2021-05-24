class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def exist_equipment?
    unless Equipment.find_by(id: params[:id])
      redirect_to root_path, alert: "備品id:#{params[:id]}は存在しません"
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :assignment_year])
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :assignment_year])
  end
end
