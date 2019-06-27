
class GamesController < ApplicationController
  def index
    render json: Game.all, adapter: :json
  end
end
