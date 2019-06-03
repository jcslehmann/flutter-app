class LikesController < ApplicationController
before_action :find_like, only: [:destroy]
after_action :verify_authorized, except: [:create, :destroy]

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      Like.new(user_id: current_user.id, bet_id: params[:id])
    end
      redirect_to root_path

  end

  def destroy
    if !already_liked?
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to root_path
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
