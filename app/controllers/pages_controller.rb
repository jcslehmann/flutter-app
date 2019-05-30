class PagesController < ApplicationController
  before_action :authenticate_user!


  def home
    @bets = Bet.all
    @bet = Bet.new
    @user = current_user
  end
end
