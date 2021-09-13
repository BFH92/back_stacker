class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render json: { message: 'Your sign Up is a success.', user_id: current_user.id }, status: :ok
  end

  def register_failed
    render json: { message: "Hummmm Something went wrong, please provide good info."}, status: :unauthorized
  end
end