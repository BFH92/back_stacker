class Users::PasswordController < ApplicationController

  def forgot

  email= params[:email]
  user = User.find_by(email:email)
    if user
      render json: {
        alert: "If this user exists, we have sent you a password reset email."
      }
      user.reset_password_instructions
    else
      render json: {
        alert: "wrong."
      }
    end
  end

  def reset
    email= params[:email]
    user = User.find_by(email:email)
    token = params[:token]
    if user.present? & user.reset_password_period_valid?

      if user.reset_password(params[:password],params[:password_confirmation] )
        render json: {
          alert: "Your password has been successfuly reset!"
        }
      else
        render json: { error: user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: {error:  ['Link not valid or expired. Try generating a new link.']}, status: :not_found
    end
  end
end

private

def password_params
  params.permit(
    user: [:email, :token, :password, :password_confirmation]
  )
end