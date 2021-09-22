class SavedSearchesController < ApplicationController
  before_action :set_saved_search, only: [:show, :update, :destroy]
  before_action :authenticate_user!
  # GET /saved_searches
  def index
    @saved_searches = SavedSearch.all.where(user_id:current_user.id)
    render json: @saved_searches
  end

  def create
    @saved_search = SavedSearch.new(staff_size: params[:staff_size], stacks: params[:stacks], company_category: params[:company_category],user_id: current_user.id)
    if @saved_search.save
      render json: @saved_search, status: :created, location: @saved_search
    else
      render json: @saved_search.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @saved_search.destroy
  end

  private
    def set_saved_search
      @saved_search = SavedSearch.find(params[:id])
    end
    def saved_search_params
      params.permit(:staff_size, :company_category, :stacks)
    end
end
