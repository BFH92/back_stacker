class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    
    render json: @users.map{|user|
      user.as_json.merge(stacks: user.stacks,user_stacks: user.users_stacks)
      }
  end

  # GET /users/1
  def show
    @user_stack = UsersStack.where(user_id:@user.id)
    @stacks_names = @user_stack.map{|stack| {name: Stack.find(stack.stack_id).name, user_stack_id: stack.id}}
    render json: @user.as_json.merge(user_stacks: @stacks_names)
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json:  @user.as_json.merge(stacks: @user.stacks)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:first_name, :last_name, :description, :stack, :github_link)
    end
end
