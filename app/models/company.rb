class Company < ApplicationRecord
  belongs_to :company_category
  has_many :stacks, through: :company_stacks
end
