class Stack < ApplicationRecord

  has_many :companies, through: :company_stacks
  has_many :users, through: :users_stacks

end
