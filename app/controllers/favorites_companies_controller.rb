class FavoritesCompaniesController < ApplicationController
  before_action :set_favorites_company, only: [ :destroy]
  before_action :authenticate_user!

  def index
    @favorites_companies = FavoritesCompany.all.where(user_id:current_user.id)
    render json: @favorites_companies
  end

  def create
    @favorites_company = FavoritesCompany.new(user_id: current_user.id, company_id:params[:company_id])
    if @favorites_company.save
      render json: @favorites_company, status: :created, location: @favorites_company
    else
      render json: @favorites_company.errors, status: :unprocessable_entity
    end
  end

  def get_favorite
    @favorite = FavoritesCompany.find_by(user_id:current_user.id, company_id: params[:company_id])
      render json: @favorite
  end

  def get_favorites_companies_by_user
    @favorites_companies = FavoritesCompany.where(user_id:current_user.id)
    render json: @favorites_companies.map{|favorite|
      company = Company.find(favorite.company_id)
      company = company.as_json.merge(stacks: company.stacks)
      favorite.as_json.merge(data: company)
      }
  
  end

  def destroy
    @favorites = FavoritesCompany.find(params[:id])

    @favorites.destroy
  end

  private
    def set_favorites_company
      @favorites_company = FavoritesCompany.find(params[:id])
    end

    def favorites_company_params
      params.require(:favorites_company).permit(:user_id, :company_id)
    end
end
