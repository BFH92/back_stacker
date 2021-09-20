class Company < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :jwt_authenticatable,:registerable,
         :recoverable, :database_authenticatable,jwt_revocation_strategy: JwtDenylist

  belongs_to :company_category, optional: true
  
  has_many :companies_stacks
  has_many :stacks, through: :companies_stacks

def self.filtering(stacks, staff_size, categories)
  @stacked_companies = Set.new

  if stacks
    stacks = stacks.split(",")
    stacks.map do|stack|
      @queries = Stack.find_by(name:stack).companies
      @queries.map do |query|
        @stacked_companies.add(query)
      end
    end
  else
    @stacked_companies = Company.all
  end

  @staff_sized_companies = Set.new
  if staff_size
    staff_size = staff_size.split(",")
    staff_size.map do |staff_size|
      @select = @stacked_companies.map do |company|
        if company.staff_size == staff_size
          @staff_sized_companies.add(company)
        end
      end
    end
  else
      @staff_sized_companies = @stacked_companies  
  end

  @categorized_companies = Set.new
  if categories
    categories = categories.split(",")
    categories.map do |category|
      @select = @staff_sized_companies.map do |company|
        if company.company_category_id = category
          @categorized_companies.add(company)
        end
      end
    end
  else
    @categorized_companies = @staff_sized_companies 
  end

  @filtered_companies = @categorized_companies
end

end