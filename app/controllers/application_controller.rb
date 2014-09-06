class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :initialize_variables

  def authenticate_user!
    redirect_to root unless user_signed_in?
    #redirect_to user_omniauth_authorize_path(:facebook) unless user_signed_in?
  end

  def initialize_variables
    @javascripts = [] if @javascripts.blank?
  end
end
