class UsersController < ApplicationController

  def splash
    render :splash
  end

  def index
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to splash_path
    else
      redirect_to new_user
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :first_name, :last_name, :email, :password, :password_confirmation)
  end

end
