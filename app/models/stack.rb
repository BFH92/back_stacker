class Stack < ApplicationRecord

  has_many :companies, through: :company_stack
  has_many :users, through: :user_stack
end
