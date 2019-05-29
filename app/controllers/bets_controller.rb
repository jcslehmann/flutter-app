class BetsController < ApplicationController
  def index
    @bets = policy_scope(Bet)
  end

  def new
    @bet = Bet.new
    @user = User.find(params[:id])
    authorize @bet
  end

  def create
    @bet = Bet.new(bet_params)
    @bet.likes = 0
    @bet.status = "Pending"
    @bet.proposer = current_user
    authorize @bet
    @bet.save
  end

  def show
    find_bet
    authorize @bet
  end

  private

  def find_bet
    @bet = Bet.find(params[:id])
  end

  def bet_params
    params.require(:bet).permit(:amount, :deadline, :proposition, :stake, :odds, :receiver)
  end
end
