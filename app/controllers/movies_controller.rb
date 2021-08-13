class MoviesController < ApplicationController
  include Sift

  before_action :set_movie, only: [:show, :update, :destroy]

  filter_on :name, type: :string
  sort_on   :creation_date, type: :date
  filter_on :genre, type: :scope, internal_name: :by_genre
  # GET /movies
  def index
    @movies = filtrate(Movie.all)

    render json: @movies , each_serializer: MovieSerializers::ListSerializer
  end

  # GET /movies/1
  def show
    render json: @movie ,serializer: MovieSerializers::DetailSerializer
  end

  # POST /movies
  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render json: @movie, status: :created, location: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /movies/1
  def update
    if @movie.update(movie_params)
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE /movies/1
  def destroy
    @movie.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :creation_date, :rating, :image, :genre_id)
    end
end
