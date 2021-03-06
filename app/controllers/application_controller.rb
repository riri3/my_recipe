# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    weekly_menus_path # ログイン後に遷移する週間献立へ遷移
  end

  def after_sign_out_path_for(_resource)
    root_path # ログアウト後にトップページへ遷移
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
