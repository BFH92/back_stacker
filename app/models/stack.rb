class Stack < ApplicationRecord

  has_many :companies_stacks
  has_many :companies, through: :companies_stacks
  has_many :users, through: :users_stacks

end
