class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  skip_before_action :verify_authenticity_token
  include CanCan::ControllerAdditions
  include SessionsHelper

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      nil
    end
  end

  helper_method :current_user

  def authorize
    redirect_to splash_path unless current_user
  end

end
