class UsersStackController < ApplicationController
  before_action :set_user_stack, only: [:show, :destroy]
  def index
    @users_stack = UsersStack.all

    render json: @users_stack
      
  end
  def show
    render json: @user_stack
  end
  def create
  #  user_stack_id = UsersStack.find_by(stack_id:Stack.find_by(name:"Python"))
    stack_id = Stack.find_by(name:params[:stack]).id
    @users_stack = UsersStack.new(user_id: current_user.id, stack_id: stack_id)

    if @users_stack.save
      render json: @users_stack, status: :created, location: @users_stack
    else
      render json: @users_stack.errors, status: :unprocessable_entity
    end
  end
  def destroy
    @user_stack.destroy
  end
  private
  def set_user_stack
    @user_stack = UsersStack.find(params[:id])
  end
  def users_stack_params
    params.permit(:user_id,:stack_id, :stack)
  end
end
