class UsersController < ApplicationController

  def splash
    render :splash
  end

  def index
    render :index
  end

  def new
    render :new
  end

  def create
    @user = User.new
    if User.save
      redirect_to splash_path
    else
      redirect_to new_user
    end
  end

end
