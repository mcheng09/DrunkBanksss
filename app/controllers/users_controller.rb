class UsersController < ApplicationController

  def splash
    if !current_user
      render :splash
    else
      redirect_to "/users/#{current_user.id}"
    end
  end

  def index
    @user = User.all
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user[:id])
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    @bet = @user.bets
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
    params.require(:user).permit(:user_name, :first_name, :last_name, :email, :password, :password_confirmation, :image_url)
  end

end
