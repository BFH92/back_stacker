class UserDeviseMailer < Devise::Mailer
  default from:"support@stacker.com" #"<#{ENV['DEFAULT_FROM_EMAIL']}>" 
  def reset_password_instructions(record, opts={})
    super
    mail(to: @user.email, subject: 'Récupération de mot de passe')
  end
end

