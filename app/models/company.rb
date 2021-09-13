class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :jwt_authenticatable,:registerable,
         :recoverable, :database_authenticatable,jwt_revocation_strategy: JwtDenylist
  belongs_to :company_category, optional: true
  has_many :stacks, through: :company_stacks
  
end
