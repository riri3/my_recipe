# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end


  # callback for google
  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    # 'request.env["omniauth.auth"]'の中にgoogleアカウントから取得したメールアドレスや名前などのデータが含まれる
    @user = User.find_or_create_by('email': request.env["omniauth.auth"].info.email, 'name': request.env["omniauth.auth"].info.name)
    @user.name = request.env["omniauth.auth"]["info"]["name"]
    @user.email = request.env["omniauth.auth"]["info"]["email"]
    @user.uid = request.env["omniauth.auth"]["extra"]["id_info"]["sub"]
    @user.provider = "google_oauth2"
    @user.password = SecureRandom.hex(10)
    if @user.save
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    end
  end

  def failure
    redirect_to root_path
  end

end
