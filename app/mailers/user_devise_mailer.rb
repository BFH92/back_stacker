class UserDeviseMailer < Devise::Mailer
  default from:"thpkata2021@gmail.com" #"<#{ENV['DEFAULT_FROM_EMAIL']}>" 
  def reset_password_instructions(record, token, opts={})
    super
    puts "USERDEVISEMAILER"
  end
end

