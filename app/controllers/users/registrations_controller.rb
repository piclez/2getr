module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create, :update]

    def configure_sign_up_params
      registration_params = [:email, :password, :password_confirmation,
        profile_attributes: [:first_name, :last_name]]

      if params[:action] == 'update'
        devise_parameter_sanitizer.permit(:account_update) {
          |u| u.permit(registration_params << :current_password)
        }
      elsif params[:action] == 'create'
        devise_parameter_sanitizer.permit(:sign_up) {
          |u| u.permit(registration_params)
        }
      end
    end
  end
end

