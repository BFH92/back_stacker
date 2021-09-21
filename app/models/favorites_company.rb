class FavoritesCompany < ApplicationRecord
  belongs_to :user
  belongs_to :company
  validates_uniqueness_of :company_id, scope: [:company_id, :user_id] 
end
