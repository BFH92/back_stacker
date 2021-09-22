class SavedSearch < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :stacks, scope: [:stacks, :staff_size, :company_category] 
end
