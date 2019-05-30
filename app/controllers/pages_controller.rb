class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @bets = Bet.all
    @bet = Bet.new
    @user = current_user
  end
end
