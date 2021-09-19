class CompaniesStack < ApplicationRecord

  belongs_to :company
  belongs_to :stack
  validates_uniqueness_of :stack_id, scope: [:stack_id, :company_id] 
end
