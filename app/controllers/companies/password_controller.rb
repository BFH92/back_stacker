class Companies::PasswordController < ApplicationController

  def forgot

  email= params[:email]
  company = Company.find_by(email:email)
    if company
      render json: {
        alert: "If this company exists, we have sent you a password reset email."
      }
      company.send_reset_password_instructions
    else
      render json: {
        alert: "wrong company"
      }
    end
  end

  def reset
    email= params[:email]
    company = Company.find_by(email:email)
    token = params[:token]
    if company.present? & company.reset_password_period_valid?

      if company.reset_password(params[:password],params[:password_confirmation] )
        render json: {
          alert: "Your password has been successfuly reset!"
        }
      else
        render json: { error: company.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: {error:  ['Link not valid or expired. Try generating a new link.']}, status: :not_found
    end
  end
end

private

def password_params
  params.permit(
    company: [:email, :token, :password, :password_confirmation]
  )
end