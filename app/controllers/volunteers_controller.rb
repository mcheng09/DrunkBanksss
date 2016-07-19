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
      redirect_to bets_path
    else
      redirect_to volunteers_path
    end
  end

end
