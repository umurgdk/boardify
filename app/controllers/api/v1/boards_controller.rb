class Api::V1::BoardsController < ApplicationController
  before_action :authenticate_user!

  respond_to :json

  def index
    @boards = current_user.boards
    render json: @boards
  end

  def show
    @board = current_user.boards.find(params[:id])
    render json: @board
  end

  def new
    render json: Board.new
  end

  def create
    @board = Board.create(board_params.merge user: current_user)

    render json: @board
  end

  def update
    @board = current_user.boards.find(params[:id])
    @board.update!(board_params)

    render json: @board
  end

  def destroy
    @board = current_user.boards.find(params[:id])
    @board.destroy

    render json: {}
  end

  private

  def board_params
    params.require(:board).permit(:title)
  end
end
