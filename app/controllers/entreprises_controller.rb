class EntreprisesController < ApplicationController
  before_action :set_entreprise, only: [:show, :update, :destroy]

  # GET /entreprises
  def index
    @entreprises = Entreprise.all

    render json: @entreprises
  end

  # GET /entreprises/1
  def show
    render json: @entreprise
  end

  # POST /entreprises
  def create
    @entreprise = Entreprise.new(entreprise_params)

    if @entreprise.save
      render json: @entreprise, status: :created, location: @entreprise
    else
      render json: @entreprise.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /entreprises/1
  def update
    if @entreprise.update(entreprise_params)
      render json: @entreprise
    else
      render json: @entreprise.errors, status: :unprocessable_entity
    end
  end

  # DELETE /entreprises/1
  def destroy
    @entreprise.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entreprise
      @entreprise = Entreprise.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entreprise_params
      params.require(:entreprise).permit(:name, :description, :stack, :github, :staff_size, :is_it_recruiting)
    end
end
