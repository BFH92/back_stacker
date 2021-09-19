class UserDeviseMailer < Devise::Mailer
  default from:"test@test.com" #"<#{ENV['DEFAULT_FROM_EMAIL']}>" 
  def reset_password_instructions(record, token, opts={})
    super
    mail(to: @user.email, subject: 'Récupération de mot de passe') 
  end
end