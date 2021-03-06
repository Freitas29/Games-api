class GenresController < ApplicationController

  before_action :set_genre, only: [:show,:update,:destroy]

  def index
    render json: Genre.all
  end

  def create
      genre = Genre.new(genre_params)

      if genre.save
        render json: genre, status: :created
      else
        render json: genre.errors,status: :unprocessable_entity
      end
  end

  def show
    render json: @genre
  end

  def update
    @genre.update(genre_params)

    render json: @genre
  end

  private

  def set_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:description)
  end

end
