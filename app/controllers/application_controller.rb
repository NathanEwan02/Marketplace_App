class ApplicationController < ActionController::Base
    #before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    include Pundit
    
    rescue_from Pundit::NotAuthorizedError, with: :forbidden

    private
    #protected

    def forbidden
        flash[:alert] = "You are not authorised to access to access this action"
        redirect_to(request.referrer || root_path)
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :username, :password, role_ids: []])
    end
end
