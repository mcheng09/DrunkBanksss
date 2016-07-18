class BetsController < ApplicationController

  def index
    @user = current_user
    @bet = Bet.all
    render :index
  end

  def new
    @bet = Bet.new
    render :new
  end

  def create
    @user = current_user
    @bet = Bet.new({name: bet_params[:name], description: bet_params[:description], amount: bet_params[:amount], user_id: @user[:id]})
    @bet.save
    redirect_to bets_path
  end

  def show
    @bet = Bet.find(params[:id])
    render :show
  end

  def edit
    @bet = Bet.find(params[:id])
    render :edit
  end

  def update
    @bet = Bet.find(params[:id])
    @bet.update(bet_params)
    if @bet.save
      redirect_to bet_path(@bet[:id])
    else
      redirect_to new_bet_path
    end
  end

  def delete
    @bet = Bet.find(params[:id])
    if @bet.destroy
      redirect_to bets_path
    else
      redirect_to bet_path(@bet[:id])
    end
  end

  private

  def bet_params
    params.require(:bet).permit(:name, :amount, :description, :user_id)
  end



end
