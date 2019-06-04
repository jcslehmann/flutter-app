class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :landing_page
  # before_action :authenticate_user!

  def home
    @bets = Bet.all
    @bet = Bet.new
    @user = current_user
    @live_bets = []
    @bets.each do |b|
      if b.status == "confirmed" || b.status == "finished" && current_user != b.proposer || current_user != b.receiver
        @live_bets << b
      end
    end
  end

  def landing_page
  end
end
