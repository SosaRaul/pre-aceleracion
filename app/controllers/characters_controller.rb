class CharactersController < ApplicationController
  include Sift

  before_action :set_character, only: [:show, :update, :destroy]

  filter_on :name, type: :string
  filter_on :age,  type: :int
  sort_on   :creation_date, type: :date
  filter_on :movies, type: :scope, internal_name: :by_movies 
  
  
  # GET /characters
  def index
    @characters = filtrate(Character.all)
    render json: @characters, each_serializer: CharacterSerializers::ListSerializer
  end

  # GET /characters/1
  def show
    render json: @character, serializer: CharacterSerializers::DetailSerializer  
  end

  # POST /characters
  def create
    @character = Character.new(character_params)

    if @character.save
      render json: @character, status: :created, location: @character
    else
      render json: @character.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /characters/1
  def update
    if @character.update(character_params)
      render json: @character
    else
      render json: @character.errors, status: :unprocessable_entity
    end
  end

  # DELETE /characters/1
  def destroy
    @character.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def character_params
      params.require(:character).permit(:name, :age, :weight, :history , :image,movie_ids: [])
    end
end
