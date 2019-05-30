class UsersController < ApplicationController
  def mybets
    @bets = current_user.bets
  end

  def index
    @users = User.all
  end

  def show
    find_user
    @user_bets = []
    @user.received_bets.each { |b| @user_bets << b }
    @user.proposed_bets.each { |b| @user_bets << b }

    # authorize @user
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
