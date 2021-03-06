class Users::OmniauthCallbacksController < ApplicationController
  def failure
    set_flash_message(:notice, :error, kind: "failed")
    redirect_to root_path
  end
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      #set_flash_message(:notice, :success, kind: "facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
