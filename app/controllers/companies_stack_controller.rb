class CompaniesStackController < ApplicationController
  def index
    @companies_stack = CompaniesStack.all

    render json: @companies_stack
      
  end
  
  def get_id
    stack_id = Stack.find_by(name:params[:stack]).id

    @company_stack = CompaniesStack.find_by(stack_id: stack_id, company_id:current_company.id)
    render json: @company_stack
  end

  def create
  
    stack_id = Stack.find_by(name:params[:stack]).id

    @companies_stack = CompaniesStack.new(company_id:current_company.id, stack_id: stack_id)

    if @companies_stack.save
      render json: @companies_stack, status: :created, location: @companies_stack
    else
      render json: @companies_stack.errors, status: :unprocessable_entity
    end
  end
  def destroy  
    @company_stack = CompaniesStack.find(params[:id])
    @company_stack.destroy
  end

  private
  def set_company_stack
    @company_stack = CompaniesStack.find(params[:id])
  end
  def companies_stack_params
    params.permit(:id,:company_id,:stack_id, :stack)
  end
end
