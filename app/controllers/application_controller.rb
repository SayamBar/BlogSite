class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

         def configure_permitted_parameters
              devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:fullname, :email, :password, :phone, :bio, :gender)}

              devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :avatar, :password, :current_password, :phone, :bio, :gender)}
         end
end
