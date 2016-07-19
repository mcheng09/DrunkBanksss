class VolunteersController < ApplicationController

  def index
    @volunteer = Volunteer.all
    render :index
  end

  def create
    @user = current_user
    @bet = Bet.find(params[:bet_id])
    @volunteer = Volunteer.new({user_id: @user[:id], bet_id: @bet[:id]})
    if @volunteer.save
      redirect_to bet_volunteers_path
    else
      redirect_to volunteers_path
    end
  end

  def delete
    @volunteer = Volunteer.find(params[:id])
    if @volunteer.destroy
      redirect_to bet_volunteers_path
    else
      redirect_to bet_volunteers_path
    end
  end

end
