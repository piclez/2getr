module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create, :update]

    def configure_sign_up_params
      puts "========================="
      devise_parameter_sanitizer.permit(:sign_up) do |u| 
        u.permit(:email, :password, :password_confirmation, :remember_me, 
        profile_attributes: [:first_name, :last_name])
      end
    end
  end
end
