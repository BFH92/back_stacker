class City < ApplicationRecord
  has_many :companies_cities
  has_many :companies, through: :companies_cities
end
