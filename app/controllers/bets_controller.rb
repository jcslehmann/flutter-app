class BetsController < ApplicationController
  def index
    @bets = Bet.all
  end

  def new
    @bet = Bet.new
    # authorize @bet
  end

  def create
    @bet = Bet.new(bet_params)
    @bet.likes = 0
    @bet.status = "Pending"
    @bet.proposer = current_user
    @bet.save
  end

  def show
    find_bet
    @bet.destroy
  end

  private

  def find_bet
    @bet = Bet.find(params[:id])
  end

  def bet_params
    params.require(:bet).permit(:amount, :deadline, :proposition, :stake, :odds, :receiver)
  end
end
