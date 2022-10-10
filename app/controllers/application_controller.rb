class ApplicationController < ActionController::Base
protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


#   def after_sign_in_path_for(resource)
#      _path()
#     end

    def after_sign_out_path_for(resource)
     root_path
    end
  protected

  def configure_permitted_parameters
    added_attrs = [ :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :password, :postal_code, :address, :telephone_number, ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end
end
