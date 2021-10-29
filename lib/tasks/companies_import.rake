require 'json'
namespace :companies_import do
  task new_data: :environment  do
    def config_json
      Dir.chdir((File.dirname(__FILE__) + "/data/"))
      file_name = Dir.glob("*.json").last

      file_path = (File.dirname(__FILE__) + "/data/#{file_name}")  
      @file = File.read(file_path)
      @companies_created = 0
      @companies_updated = 0
    end

    def get_companies_from(file)
      @not_recognized_stacks = Set.new
    
      config_json()
      new_companies = JSON.parse(@file)
      return new_companies
    end
    def update_company_with(new_company,existing_company)
      puts "update"
    
      company = existing_company.update(
        name: new_company['name'],
        website_link: new_company['website'] ? new_company['website'] : "" 
      )
      @companies_updated += 1 
      return existing_company
    end
    def create(new_company)
    puts "create company"
    begin
      company = Company.create!(
        name: new_company['name'],
        email: "#{new_company['name']}@admin.com",
        website_link: new_company['website'] ? new_company['website'] : "" 
      )
      @companies_created +=1
    rescue => exception
      existing_company = Company.find_by(name:new_company['name'])
      puts exception.message
      company = update_company_with(new_company,existing_company)
    end
      return company
    end

    def associate_stacks_to_company(company_id,stacks_ids)
      puts "associate"
      stacks_ids.map do |stack_id|
      begin
      company_stacks = CompaniesStack.create!(
        company_id: company_id,
        stack_id: stack_id
      )
      rescue => exception
        puts exception.message
      end
    end
    end
    def find_stacks(list)
      puts "find"
      stacks_ids = []
      list.map do |stack|
        begin
        stacks_ids << Stack.find_by(slug:stack).id
        rescue
          @not_recognized_stacks.add(stack)
        end
      end
      return stacks_ids
    end

    def update_new_company
      
    end
    def perform
      new_companies = get_companies_from(@file)
      start_time = Time.now
      new_companies.each do |new_company|
        begin
          company = create(new_company)
          stacks_ids = find_stacks(new_company['stacks'])
          associate_stacks_to_company(company.id,stacks_ids)
        rescue => exception
          puts exception.message
        end
      
      end
      end_time = Time.now
      puts "add Companies to db in #{end_time - start_time} seconds"
    end
    perform()
    puts "#######"
    puts @not_recognized_stacks
    puts "companies created : #{@companies_created}"
    puts "companies updated : #{@companies_updated}"
  end
  #TODO: faire un bon create des familles, trop de complexité avec devise et les relations
  
end