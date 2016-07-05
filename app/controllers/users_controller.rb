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
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user[:id])
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user[:id])
    else
      redirect_to new_user_path
    end
  end

  def delete
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to splash_path
    else
      redirect_to user_path(@user[:id])
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :first_name, :last_name, :email, :password, :password_confirmation)
  end

end
