class SessionsController < ApplicationController
  include SessionsHelper

  def new
    render :new
  end

  def create
    user = User.find_by_user_name(params[:user_name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user[:id])
    else
      redirect_to new_user_path
    end
  end

  def delete
    session[:user_id] = nil
    redirect_to splash_path
  end

end
