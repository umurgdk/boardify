class Api::V1::CardsController < ApplicationController
  respond_to :json

  def index
  end

  def show
  end

  def new
  end

  def create
    @card = Card.create(card_params.merge user_id: User.first.id)
    render json: @card
  end

  def edit
  end

  def update
    @card = Card.find(params[:id])
    @card.update!(card_params)

    render json: @card
  end

  def destroy
  end

  private
  def card_params
    params.require(:card).permit(:title, :votes, :column_id, :order)
  end
end
