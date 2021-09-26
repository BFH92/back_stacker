class CompanyMailer < ApplicationMailer

  def welcome_email(company)
    @company = company

    @url  = 'https://stacker-front.herokuapp.com/company/dashboard' 

    mail(to: @company.email, subject: 'Bienvenue chez Stacker!') 
  end
end
