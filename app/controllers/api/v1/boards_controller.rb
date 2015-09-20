class Api::V1::BoardsController < ApplicationController
  respond_to :json

  def index
  end

  def show
    render json: Board.find(params[:id])
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end
end
