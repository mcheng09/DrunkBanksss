class BetsController < ApplicationController

  def index
    @bet = Bet.all
    render :index
  end

  def new
    @bet = Bet.new
    render :new
  end

  def create
    @bet = Bet.new(bet_params)
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

  private

  def bet_params
    params.require(:bet).permit(:name, :amount, :description, :user_id)
  end



end
