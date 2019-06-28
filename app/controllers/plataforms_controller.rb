class PlataformsController < ApplicationController

  before_action :set_plataform, only: [:show,:update,:destroy]

  def index
    render json: Plataform.all
  end

  def create
    plataform = Plataform.new(plataforms_params)

    if plataform.save
      render json: plataform, status: :created
    else
      render json: plataform.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @plataform
  end

  def update
    @plataform.update(plataforms_params)

    render json: @plataform
  end

  private

  def set_plataform
    @plataform = Plataform.find(params[:id])
  end

  def plataforms_params
    params.require(:plataform).permit(:description)
  end
end
