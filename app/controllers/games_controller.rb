class GamesController < ApplicationController
  before_action :set_game, only: [:show,:update,:destroy]

  include Pagination

  def index
    games =  Game.paginate(page: params[:page] || 1, per_page: params[:per_page] || 6)
    render json: {
      games: ActiveModelSerializers::SerializableResource.new(games), 
      meta: pagination_dict(games)
    }
  end

  def create
    game = Game.new(game_params)

    if game.save
      render json: game, status: :created
    else
      render json: game.errors, status: :unprocessable_entity
    end
  end

  def update
    @game.update(game_params)

    render json: @game
  end

  def show
    render json: @game
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:title,:image,:description,genres: [],plataforms: [])
  end
end
