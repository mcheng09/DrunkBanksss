class VolunteersController < ApplicationController

  def index
    @bet = Bet.find(params[:bet_id])
    @volunteer = @bet.volunteers
    render :index
  end

  def create
    @user = current_user
    @bet = Bet.find(params[:bet_id])
    isvolunteer = false
    @bet.volunteers do |volunteer|
      if current_user == volunteer.user
        isvolunteer = true
        break
      end
    end
    if isvolunteer
      flash[:error] = "You many not volunteer twice for the same bet."
      redirect_to splash_path
    else
      if current_user == @bet.user
        flash[:error] = "You may not volunteer for a bet you created."
        redirect_to splash_path
      else
        @volunteer = Volunteer.new({user_id: @user[:id], bet_id: @bet[:id]})
        if @volunteer.save
          redirect_to bet_volunteers_path
        else
          redirect_to volunteers_path
        end
      end
    end
  end

  def delete
    @volunteer = Volunteer.find(params[:id])
    @bet = Bet.find(params[:bet_id])
    if @volunteer.destroy
      flash[:error] = "Scaredy Pants."
      redirect_to splash_path
    else
      redirect_to bet_path[@bet[:id]]
    end
  end

end
