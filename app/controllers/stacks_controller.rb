class StacksController < ApplicationController
  before_action :set_stack, only: [:show, :update, :destroy]

  # GET /stacks
  def index
    @stacks = Stack.all

    render json: @stacks.map{|stack|
      stack.as_json.merge(stack_category: stack.stack_category.name)
    }
  end

  # GET /stacks/1
  def show
    render json: @stack
  end

  # POST /stacks
  def create
    @stack = Stack.new(stack_params)

    if @stack.save
      render json: @stack, status: :created, location: @stack
    else
      render json: @stack.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stacks/1
  def update
    if @stack.update(stack_params)
      render json: @stack
    else
      render json: @stack.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stacks/1
  def destroy
    @stack.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stack
      @stack = Stack.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stack_params
      params.require(:stack).permit(:name)
    end
end
