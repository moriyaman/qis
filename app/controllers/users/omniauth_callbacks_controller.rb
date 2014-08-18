class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    callback
  end

  def github
    callback
  end

  def twitter
    callback
  end

  private
  def callback
    omniauth_params = request.env["omniauth.auth"]
    @user = User.find_or_create_by_auth(omniauth_params)
    if @user.persisted?  
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
    else
      session["devise.#{omniauth_params.provider}_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end 
  end
end
