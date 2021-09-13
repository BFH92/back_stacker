class Company < ApplicationRecord

  belongs_to :company_category, optional: true
  has_many :stacks, through: :company_stacks
  
end
