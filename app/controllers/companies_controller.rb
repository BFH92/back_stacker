class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :update, :destroy]

  def index
    @short_list = params[:short_list]
    range_1 = @short_list.to_i*20
    @completed_companies = Company.where.not(description:"null", name: "null", company_category_id:"null").offset(range_1).limit(100)
    @stacks = params[:stack]
    @staff_size = params[:staff_size]
    @categories = params[:categories]
    @filtered_companies = @completed_companies.filtering(@stacks,@staff_size,@categories,@completed_companies)
    @filtered_companies = @filtered_companies.map{|company|
      category_id = company.company_category_id
      company_category_name = CompanyCategory.find(category_id).name
      company.as_json.merge(stacks: company.stacks, company_stacks: company.companies_stacks, category_name: company_category_name  )
      }
      if current_user
        render json:  @filtered_companies.as_json.first(20)
      else
        companies =[]
        @filtered_companies.first(20).map{|company|
          companies.push(company.except("email"))
        }
        render json:  companies
      end
  end

  def show
    @company_stack = CompaniesStack.where(company_id: @company.id)
    @stacks_names = @company_stack.map{|stack| {name: Stack.find(stack.stack_id).name, company_stack_id: stack.id}}
    render json: @company.as_json.merge(company_stacks: @stacks_names, company_id: @company.id)
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      render json: @company, status: :created, location: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  def update
    if @company.update(company_params)
      render json: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @company.destroy
  end

  private
    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.permit(:name, :company_category_id, :description, :website_link, :github_link, :staff_size, :is_it_recruiting, :short_list)
    end
end
