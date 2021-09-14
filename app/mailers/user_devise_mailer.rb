class UserDeviseMailer < Devise::Mailer
  default from:"test@test.com" #"<#{ENV['DEFAULT_FROM_EMAIL']}>" 
  def reset_password_instructions(record, token, opts={})
    super
  end
end