class UsersStackController < ApplicationController

  def index
    @users_stack = UsersStack.all

    render json: @users_stack
      
  end
  
  def get_id
    stack_id = Stack.find_by(name:params[:stack]).id
    puts "==++=="
    puts stack_id
    puts "==++=="
    @user_stack = UsersStack.find_by(stack_id: stack_id, user_id: current_user.id)
    puts "====="
    puts @user_stack.id
    puts "====="
    render json: @user_stack
  end

  def create
  
    stack_id = Stack.find_by(name:params[:stack]).id
    puts "=== curerent user"
    puts current_user.id
    puts "=== curerent user"

    @users_stack = UsersStack.new(user_id:current_user.id, stack_id: stack_id)

    if @users_stack.save
      render json: @users_stack, status: :created, location: @users_stack
    else
      render json: @users_stack.errors, status: :unprocessable_entity
    end
  end
  def destroy  
    @user_stack = UsersStack.find(params[:id])
    @user_stack.destroy
  end

  private
  def set_user_stack
    @user_stack = UsersStack.find(params[:id])
  end
  def users_stack_params
    params.permit(:id,:user_id,:stack_id, :stack)
  end
end
