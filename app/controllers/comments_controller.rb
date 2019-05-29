class CommentsController < ApplicationController

  before_action :set_bet, only: [:new, :create, :destroy]

  def new
    @comment = Comment.new
    authorize @comment
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.bet = @bet
    authorize @comment
    @comment.save
    @bet.save
    redirect_to bets_path
  end

  def edit
    @comment = comment.find(params[:id])
    authorize @comment
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      authorize @comment
      @comment.save
      redirect_to comment_path(@comment)
    else
      render :edit
    end
  end

  def destroy
    @bet.comment.destroy
  end

  private

  def set_bet
    @bet = Bet.find(params[:bet_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
