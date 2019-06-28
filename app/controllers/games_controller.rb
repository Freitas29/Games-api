
class GamesController < ApplicationController

  before_action :set_game, only: [:show,:update,:destroy]

  def index
    render json: Game.all
  end

  def create
    game = Game.new(game_params)

    if game.save
      render json: game, status: :created
    else
      render json: game.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @game
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:title,:description,:genres,:plataforms)
  end
end
