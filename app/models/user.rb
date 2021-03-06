class User < ApplicationRecord
  after_create :welcome_send

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :jwt_authenticatable,:registerable,
         :recoverable, :database_authenticatable,jwt_revocation_strategy: JwtDenylist
         
  has_many :users_stacks
  has_many :stacks, through: :users_stacks
  has_many :favorites_companies
  has_many :saved_searches
  
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  
end
