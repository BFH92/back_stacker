class CompaniesStack < ApplicationRecord

  belongs_to :company
  belongs_to :stack
  #validates_uniqueness_of :stack_id, scope: [:stack_id, :company_id] TODO: à réactiver après seeds en prod
end
