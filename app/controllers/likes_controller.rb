class LikesController < ApplicationController
before_action :find_like, only: [:destroy]
after_action :verify_authorized, except: [:create, :destroy]

  def create
    @like = Like.new(user_id: current_user.id, bet_id: params[:bet_id])
    @like.save
    respond_to do |format|
      format.html { redirect_to home_path }
      format.js
    end
  end

  def destroy
    @like.destroy
    authorize @like
  end

  private

  def find_bet
    @bet = Like.find(params[:id].bet)
  end

  def already_liked?
    Like.where(user_id: current_user.id, bet_id: params[:bet_id]).exists?
  end

  def find_like
    @like = Like.find(params[:id])
  end

end
