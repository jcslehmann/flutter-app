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
    @user = User.find(params[:id])
  end
end
