class Company < ApplicationRecord
  after_create :welcome_send
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :jwt_authenticatable,:registerable,
         :recoverable, :database_authenticatable,jwt_revocation_strategy: JwtDenylist

  belongs_to :company_category, optional: true
  
  has_many :companies_stacks
  has_many :stacks, through: :companies_stacks

def self.filtering(stacks, staff_size, categories, completed_companies)
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
    @stacked_companies = completed_companies
  end
  @staff_sized_companies = Set.new
  if staff_size
    staff_size = staff_size.split(",")
    staff_size.map do |staff_size|
      @stacked_companies.map do |company|
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
    puts "categories"
    puts categories
    puts "categories"
    categories.map do |category|
      @staff_sized_companies.map do |company|
       if company.company_category.id == category.to_i
         @categorized_companies.add(company)
         puts "add"
       end
      end
    end
  else
    @categorized_companies = @staff_sized_companies 
  end

  @filtered_companies = @categorized_companies
  
end
def welcome_send
  CompanyMailer.welcome_email(self).deliver_now
end
end