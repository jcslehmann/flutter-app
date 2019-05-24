class UsersController < ApplicationController
  def my_bets
    @user = current_user
    authorize @user
    @bets = @user.bets
  end

  def index
    @users = User.all
  end

  def show
    find_user
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end