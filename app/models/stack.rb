class Stack < ApplicationRecord

  has_many :companies_stacks
  has_many :companies, through: :companies_stacks
  has_many :users, through: :users_stacks
  belongs_to :stack_category
end
