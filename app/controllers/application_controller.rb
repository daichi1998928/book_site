class ApplicationController < ActionController::Base



  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(resource) # ログイン後に遷移するpathを設定
  end

  def after_sign_up_path_for(resource)
    user_path(resource) # ログア
  end

  def after_sign_out_path_for(resource)
    root_path(resource) # ログア
  end



  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])

  end








end
