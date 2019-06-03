class UsersController < ApplicationController
  def mybets
    @bets = current_user.bets
  end

  def index
    @users = policy_scope(User)
    @user = current_user
    @sorted_usersbyrank = User.order("ranking ASC")
    @sorted_usersrank = @sorted_usersbyrank.select { |user| user != current_user}
    @sorted_usersbyalphabet = User.order("first_name ASC")
    @sorted_usersalphabet = @sorted_usersbyalphabet.select { |user| user != current_user}
  end

  def show
    find_user
    @user_bets = []
    @user.received_bets.each { |b| @user_bets << b }
    @user.proposed_bets.each { |b| @user_bets << b }
    authorize @user
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
