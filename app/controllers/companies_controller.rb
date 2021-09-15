class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :update, :destroy]

  # GET /companies

  def index
    @companies = Set.new
    @names = params[:name]
    if @names
      @names = @names.split(",")
      @names.map do|name|
        @queries = Stack.find_by(name:name).companies
        @queries.map do |query|
          @companies.add(query)
        end
      end
    else
      @companies = Company.all
    end

    @staff_size = params[:staff_size]
    @filtered_companies = Set.new
    if @staff_size
      @staff_size = @staff_size.split(",")
      @staff_size.map do |staff_size|
        @select = @companies.map do |company|
          if company.staff_size == staff_size
            @filtered_companies.add(company)
          end
        end
      end
    else
        @filtered_companies = @companies    
    end
    render json: @filtered_companies.map{|company|
      company.as_json.merge(stacks: company.stacks)
      }
  end

  # GET /companies/1
  def show
    render json: @company
  end

  # POST /companies
  def create
    @company = Company.new(company_params)

    if @company.save
      render json: @company, status: :created, location: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
      render json: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:name, :description, :stack, :github, :staff_size, :is_it_recruiting)
    end
end
