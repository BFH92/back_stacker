class Companies::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if company_signed_in?
      render json: { message: 'You are logged in!', company_id: current_company.id  }, status: :ok
    else
      render json: { message: 'please login.' }, status: :unauthorized
    end
  end

  def respond_to_on_destroy
    log_out_success && return if current_company

    log_out_failure
  end

  def log_out_success
    render json: { message: "You are logged out." }, status: :ok
  end

  def log_out_failure
    render json: { message: "Fail to logout."}, status: :unauthorized
  end
end