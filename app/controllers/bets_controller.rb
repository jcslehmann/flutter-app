class BetsController < ApplicationController
  before_action :find_bet, only: [:show, :edit, :update]

  def index
    @bets = policy_scope(Bet)
    @user = current_user
  end

  def new
    @bet = Bet.new
    @user = User.find(params[:id])
    authorize @bet
  end

  def create
    @user = current_user
    @bet = Bet.new(bet_params)
    @bet.status = "pending"
    @bet.proposer = current_user
    @receiver = User.find(params[:receiver])
    @bet.receiver = @receiver
    authorize @bet

    if @bet.save
      redirect_to bets_path
    else
      render :new
    end
  end

  def show
    authorize @bet
    @user = current_user
  end

  def edit
    authorize @bet
  end

  def update
    if params[:receiver_accepting] == 'true'
      @bet.status = 'confirmed'
      @bet.save
    end

    if params[:proposer_verdict_false] == 'true'
      @bet.proposer_verdict = false
      if @bet.receiver_verdict == false
        @bet.consensus_reached = true
        @bet.status = "finished"
        @bet.final_outcome = false
      elsif @bet.receiver_verdict == true
        @bet.consensus_reached = false
        @bet.status = "finished"
      end
      @bet.save
    end

    if params[:proposer_verdict_true] == 'true'
      @bet.proposer_verdict = true
      if @bet.receiver_verdict == true
        @bet.consensus_reached = true
        @bet.status = "finished"
        @bet.final_outcome = true
      elsif @bet.receiver_verdict == false
        @bet.consensus_reached = false
        @bet.status = "finished"
      end
      @bet.save
    end

    if params[:receiver_verdict_false] == 'true'
      @bet.receiver_verdict = false
      if @bet.proposer_verdict == false
        @bet.consensus_reached = true
        @bet.status = "finished"
        @bet.final_outcome = false
      elsif @bet.receiver_verdict == true
        @bet.consensus_reached = false
        @bet.status = "finished"
      end
      @bet.save
    end

    if params[:receiver_verdict_true] == 'true'
      @bet.receiver_verdict = true
      if @bet.proposer_verdict == true
        @bet.consensus_reached = true
        @bet.status = "finished"
        @bet.final_outcome = true
      elsif @bet.receiver_verdict == false
        @bet.consensus_reached = false
        @bet.status = "finished"
      end
      @bet.save
    end

    redirect_to bet_path(@bet)
  end

  private

  def find_bet
    @bet = Bet.find(params[:id])
    authorize @bet
  end

  def bet_params
    params.require(:bet).permit(:amount, :deadline, :proposition, :stake, :odds, :receiver)
  end
end
