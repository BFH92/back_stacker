class CompaniesStack < ApplicationRecord

  belongs_to :company, dependent: :destroy
  belongs_to :stack
end
