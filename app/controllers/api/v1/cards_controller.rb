class Api::V1::CardsController < ApplicationController
  before_action :authenticate_user!

  respond_to :json

  def index
    @cards = current_user.cards.all    
    render json: @cards
  end

  def show
    @card = current_user.find(params[:id])
    render json: @card
  end

  def new
    @card = Card.new
    render json: @card
  end

  def create
    @board = Board.find(create_card_params[:board_id])

    unless current_user.can_manage_cards(@board)
        render status: 404
        return
    end

    @column = @board.columns.find(create_card_params[:column_id])

    new_params = create_card_params
    new_params.delete :board_id
    new_params.delete :column_id

    new_params = new_params.merge user: current_user

    @card = @column.cards.create!(new_params)
    render json: @card
  end

  def edit
    @card = Card.find(params[:id])

    unless current_user.can_manage_cards(@card.column.board)
      render status: 404
      return
    end

    render json: @card
  end

  def update
    @card = Card.find(params[:id])
    new_params = update_card_params
    new_votes = new_params[:votes]

    new_params.delete(:votes)

    if @card.votes.count != new_votes
      user_vote = @card.votes.find_by_user_id(User.first.id)

      unless user_vote.nil?
        user_vote.destroy!
      else
        @card.votes.create!(user: User.first)
      end
    end

    @card.update!(new_params)

    render json: @card
  end

  def destroy
  end

  private
  def create_card_params
    params.require(:card).permit(:title, :order, :column_id, :board_id)
  end

  def update_card_params
    params.require(:card).permit(:title, :votes, :column_id, :board_id, :order)
  end
end
